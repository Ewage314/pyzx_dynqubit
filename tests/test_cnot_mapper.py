
from calendar import c
from tkinter.tix import ROW
import unittest
import sys

from pyzx.routing.steiner import rowcol
if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')
import numpy as np

from pyzx.linalg import Mat2
from pyzx.routing.cnot_mapper import gauss, STEINER_MODE, GAUSS_MODE, ROWCOL_MODE, GENETIC_STEINER_MODE, PSO_STEINER_MODE, cnot_fitness_func, sequential_gauss, reverse_traversal
from pyzx.routing.architecture import Architecture, create_architecture, REC_ARCH, SQUARE, IBMQ_SINGAPORE, RIGETTI_16Q_ASPEN, architectures, dynamic_size_architectures, DENSITY, hamiltonian_path_architectures
from pyzx.parity_maps import CNOT_tracker, build_random_parity_map
from pyzx.machine_learning import GeneticAlgorithm
from pyzx.circuit import CNOT
from pyzx.extract import permutation_as_swaps
from pyzx.routing.steiner import permrowcol

SEED = 42
SKIP_LONG_TESTS = True

class TestSteiner(unittest.TestCase):

    def setUp(self):
        self.n_tests = 100
        self.arch = create_architecture(SQUARE, n_qubits=16) #Needs to have a square number of qubits to test the square architecture.
        self.n_qubits = self.arch.n_qubits
        depth = 20
        self.circuit = [CNOT_tracker(self.arch.n_qubits) for _ in range(self.n_tests)]
        np.random.seed(SEED)
        self.matrix = [build_random_parity_map(self.n_qubits, depth, self.circuit[i]) for i in range(self.n_tests)]
        self.aggr_circ = CNOT_tracker(self.arch.n_qubits)
        for c in self.circuit:
            for g in c.gates:
                self.aggr_circ.add_gate(g)

    def assertGates(self, circuit, architecture=None):
        if architecture is None:
            architecture = self.arch
        for gate in circuit.gates:
            if hasattr(gate, "name") and gate.name == "CNOT":
                qubits = (gate.control, gate.target)
                edge = (architecture.qubit2vertex(qubits[0]), architecture.qubit2vertex(qubits[1]))
                edges = list(architecture.graph.edges())
                edges += [tuple(reversed(edge)) for edge in edges]
                self.assertIn(edge, edges)
                #self.assertTrue(edge in architecture.graph.edges() or tuple(reversed(edge)) in architecture.graph.edges())

    def assertMat2Equal(self, m1, m2, triangle=False):
        if triangle:
            self.assertListEqual(*[[m.data[i, j] for i in range(self.n_qubits) for j in range(self.n_qubits) if i >= j] for m in [m1, m2]])
        else:
            self.assertNdArrEqual(m1.data, m2.data)

    def assertMat2EqualNdArr(self, mat, ndarr):
        self.assertNdArrEqual(mat.data, ndarr)

    def assertNdArrEqual(self, a1, a2):
        if isinstance(a1, list):
            if isinstance(a2, list):
                self.assertListEqual(a1, a2)
            else:
                self.assertListEqual(a1, a2.tolist())
        else:
            if isinstance(a2, list):
                self.assertListEqual(a1.tolist(), a2)
            else:
                self.assertListEqual(a1.tolist(), a2.tolist())

    def assertCircuitEquivalentNdArr(self, circuit, ndarr):
        self.assertMat2EqualNdArr(circuit.matrix, ndarr)

    def assertCircuitEquivalent(self, c1, c2):
        self.assertMat2Equal(c1.matrix, c2.matrix)

    def assertIsPerm(self, l):
        self.assertTrue(all([i in l for i in range(len(l))]))

    """ These tests require a graph with hamiltonian path and only checks if the distance is equal to the length of the path found, which may not be the shortest...
    def test_full_shortest_path(self):
        # Get the stored distances
        arch = create_architecture(SQUARE, n_qubits=25) # Test assumes
        full = arch.distances["full"]
        # check shortest path between two bits in the architecture
        for root in range(self.n_qubits):
            for v1 in range(root+1):
                for v2 in range(v1, root+1):
                    distance, path = full[root][(v2, v1)]
                    self.assertEqual(distance, len(path))

    def test_upper_shortest_path(self):
        arch = create_architecture(SQUARE, n_qubits=25)
        upper = self.arch.distances["upper"]
        for root in range(self.n_qubits):
            for v1 in range(root, self.n_qubits):
                for v2 in range(root, self.n_qubits):
                    distance, path = upper[root][(v1, v2)]
                    self.assertEqual(distance, len(path))
    """

    def test_architectures(self):
        for i in range(self.n_tests):
            for name in architectures:
                #print("Testing", name)
                if name in dynamic_size_architectures:
                    if name not in hamiltonian_path_architectures:
                        #continue
                        # This is DENSITY and it gets in an infinite loop when building steiner trees!
                        architecture = create_architecture(name, n_qubits=self.n_qubits)
                    else:
                        try:
                            architecture = create_architecture(name, n_qubits=self.n_qubits)
                        except KeyError as e:
                            if name == SQUARE:
                                print("WARNING! skipping SQUARE architecture due to non-square number of qubits:", self.n_qubits)
                            else:
                                raise e                        
                elif name in hamiltonian_path_architectures:
                    architecture = create_architecture(name)
                else:
                    architecture = create_architecture(name)
                architecture.visualize(name+".png")
                if self.n_qubits == architecture.n_qubits:
                    with self.subTest(i=i, arch=architecture.name):
                        self.do_gauss(STEINER_MODE, self.matrix[i], architecture=architecture)


    def test_all_cnots_valid(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                circuit = CNOT_tracker(self.arch.n_qubits)
                matrix = Mat2(np.copy(self.matrix[i]))
                _ = gauss(STEINER_MODE, matrix, architecture=self.arch, full_reduce=True, y=circuit)
                self.assertGates(circuit)

    def do_gauss(self, mode, array, full_reduce=True, with_assert=True, architecture=None):
        if architecture is None:
            architecture = self.arch
        circuit = CNOT_tracker(self.arch.n_qubits)
        matrix = Mat2(np.copy(array))
        rank = gauss(mode, matrix, architecture=architecture, full_reduce=full_reduce, y=circuit)
        with_assert and mode == STEINER_MODE and self.assertGates(circuit, architecture)
        with_assert and full_reduce and self.assertCircuitEquivalentNdArr(circuit, array)
        return circuit, matrix, rank

    def test_gauss(self):
        modes = {}
        modes[True] = [GAUSS_MODE, STEINER_MODE, ROWCOL_MODE]
        modes[False] = [GAUSS_MODE, STEINER_MODE]
        for i in range(self.n_tests):
            with self.subTest(i=i):
                for full_reduce in [False, True]:
                    matrices = []
                    ranks = []
                    circuits = []
                    for mode in modes[full_reduce]:
                        circuit, matrix, rank = self.do_gauss(mode, self.matrix[i], full_reduce=full_reduce, with_assert=True)
                        circuits.append(circuit)
                        ranks.append(rank)
                        matrices.append(matrix.data)
                        full_reduce and self.assertCircuitEquivalent(circuit, self.circuit[i])
                    #self.assertEqual(*ranks)
                    if full_reduce:
                        self.list_to_2params_call(matrices, self.assertMat2Equal)
                        self.list_to_2params_call(circuits, self.assertCircuitEquivalent)
                    else:
                        self.list_to_2params_call(matrices, self.assertMat2Equal, triangle=True)

    def list_to_2params_call(self, l, function, **kwargs):
        for p1, p2 in zip(l, l[1:]+[l[0]]):
            function(p1, p2, **kwargs)

    def test_initial_circuit(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                self.assertCircuitEquivalentNdArr(self.circuit[i], self.matrix[i])

    def reverse_permutation(self, perm):
        return [perm.tolist().index(i) for i in range(len(perm))]

    def do_permutated_gaus(self, array, perm1, perm2, mode=STEINER_MODE, full_reduce=True, with_assert=True):
        with_assert and self.assertIsPerm(perm1)
        with_assert and self.assertIsPerm(perm2)
        reordered_array = array[perm1][:, perm2]
        undo_perm1 = self.reverse_permutation(perm1)
        undo_perm2 = self.reverse_permutation(perm2)
        with_assert and self.assertNdArrEqual(array, reordered_array[undo_perm1][:, undo_perm2])
        circuit, matrix, rank = self.do_gauss(mode, reordered_array, full_reduce=full_reduce, with_assert=with_assert)
        with_assert and self.assertNdArrEqual(np.asarray(circuit.matrix.data)[undo_perm1][:, undo_perm2], array)
        return circuit, matrix, rank

    def test_permutated_gauss(self):
        if SKIP_LONG_TESTS: 
            return
        for i in range(self.n_tests):
            with self.subTest(i=i):
                perm = np.random.permutation(self.n_qubits)
                perm2 = np.random.permutation(self.n_qubits)
                self.do_permutated_gaus(self.matrix[i], perm, perm)
                self.do_permutated_gaus(self.matrix[i], perm, perm2)

    def test_permrowcol(self):
        print("Testing PermRowCol")
        #print("Original\tSteiner\tPermRowCol", "RowCol")
        #ng1, ng2, ng3, ng4 = 20,0,0, 0
        #d1, d2, d3, d4 = 0,0,0, 0
        for i in range(self.n_tests):
            with self.subTest(i=i):
                architecture = self.arch
                array = np.copy(self.matrix[i].data)
                circuit = CNOT_tracker(self.arch.n_qubits)
                matrix = Mat2(array)
                permutation = permrowcol(matrix, architecture, y=circuit)
                undo_perm = self.reverse_permutation(permutation)
                # Check if the resulting parity matrix is a permutation matrix with the given permutation.
                self.assertNdArrEqual(np.asarray(matrix.data)[:, undo_perm], np.identity(len(matrix.data)))
                """
                print(i)
                print(np.array(self.matrix[i].data))
                print(permutation)
                print(np.asarray(circuit.matrix.data))
                print(circuit.gates)
                print(np.asarray(circuit.matrix.data)[:, permutation])
                input("check")
                """
                # Check if the parity matrix of the generated circuit is equal to that of the original circuit.
                self.assertNdArrEqual(np.asarray(circuit.matrix.data)[:, permutation], self.matrix[i].data)
                """
                # Gather some quick preliminary results - hack
                ng3 += circuit.gather_metrics()["n_cnots"]
                d3 += circuit.gather_metrics()["depth"]
                c2, _, _ = self.do_gauss(STEINER_MODE, np.copy(self.matrix[i].data),architecture=architecture)
                ng2 += c2.gather_metrics()["n_cnots"]
                d2 += c2.gather_metrics()["depth"]
                c4, _, _ = self.do_gauss(ROWCOL_MODE, np.copy(self.matrix[i].data),architecture=architecture)
                ng4 += c4.gather_metrics()["n_cnots"]
                d4 += c4.gather_metrics()["depth"]
                d1 += sum([self.circuit[i].gather_metrics()["depth"]])
        print(ng1, ng2/self.n_tests, ng3/self.n_tests, ng4/self.n_tests)
        print(d1/self.n_tests, d2/self.n_tests, d3/self.n_tests, d4/self.n_tests)
        """

    def test_reverse_traversal(self):
        print("Skipping reverse traversal tests")
        return
        for i in range(self.n_tests):
            with self.subTest(i=i):
                architecture = self.arch
                array = np.copy(self.matrix[i].data)
                print("Test", i)
                print(np.array(self.matrix[i].data))
                circuit, initial_permutation, output_permutation = reverse_traversal(Mat2(array), architecture)
                undo_perm = self.reverse_permutation(initial_permutation)
                print(initial_permutation, output_permutation)
                print(np.array(circuit.matrix.data))
                print(np.asarray(circuit.matrix.data)[:, output_permutation][initial_permutation])
                #input("next")
                self.assertNdArrEqual(np.asarray(circuit.matrix.data)[:, output_permutation][initial_permutation], self.matrix[i].data)

    def test_reverse_traversal_each_step(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                return #TODO
                architecture = self.arch
                best = None
                for max_iter in range(1, 100):
                    array = np.copy(self.matrix[i].data)
                    circuit = CNOT_tracker(self.arch.n_qubits)
                    matrix = Mat2(array)
                    permutation = reverse_traversal(matrix, architecture, max_iter=max_iter, y=circuit)
                    undo_perm = self.reverse_permutation(permutation)
                    self.assertNdArrEqual(np.asarray(matrix.data)[:, undo_perm], np.identity(len(matrix.data)))
                    self.assertNdArrEqual(np.asarray(circuit.matrix.data)[:, permutation], self.matrix[i].data)
                    cnots = circuit.gather_metrics["n_cnots"]
                    if best is not None:
                        self.assertLessEqual(best, cnots)
                    best = cnots

    def test_reverse_traversal_step_gap(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                return # TODO figure out how to test the max_step_gap parameter.
                architecture = self.arch
                best = None
                for step_gap in range(100):
                    array = np.copy(self.matrix[i].data)
                    circuit = CNOT_tracker(self.arch.n_qubits)
                    matrix = Mat2(array)
                    permutation = reverse_traversal(matrix, architecture, max_iter=max_iter, y=circuit)
                    undo_perm = self.reverse_permutation(permutation)
                    self.assertNdArrEqual(np.asarray(matrix.data)[:, undo_perm], np.identity(len(matrix.data)))
                    self.assertNdArrEqual(np.asarray(circuit.matrix.data)[:, permutation], self.matrix[i].data)
                    cnots = circuit.gather_metrics["n_cnots"]
                    if best is not None:
                        self.assertLessEqual(best, cnots)
                    best = cnots
                    

    def test_genetic_optimization(self):
        if SKIP_LONG_TESTS: 
            return
        for i in range(1): # Takes too long otherwise
            with self.subTest(i=i):
                population = 50
                crossover_prob = 0.8
                mutate_prob = 0.2
                n_iter = 100
                optimizer = GeneticAlgorithm(population, crossover_prob, mutate_prob, cnot_fitness_func(STEINER_MODE, Mat2(self.matrix[i]), self.arch))
                best_permutation = optimizer.find_optimimum(self.n_qubits, n_iter)
                self.do_permutated_gaus(self.matrix[i], best_permutation, best_permutation)

    def test_pso_optimization(self):
        if SKIP_LONG_TESTS: 
            return
        modes = [STEINER_MODE, GENETIC_STEINER_MODE]#, PSO_STEINER_MODE]
        for p in range(self.n_tests):
            with self.subTest(i=p):
                order = np.random.permutation(self.n_tests)[:p+1]
                matrices = [self.matrix[c] for c in order]
                for mode in modes:
                    for permute_input, permute_output in [(i,j) for i in [True, False] for j in [True, False]]:
                        with self.subTest(i=(p, mode, permute_input, permute_output)):
                            circuits, perms, score = sequential_gauss([Mat2(np.copy(m)) for m in matrices], mode=mode, architecture=self.arch, full_reduce=True, 
                                                                        n_steps=5, swarm_size=10, population_size=5, n_iterations=5, input_perm=permute_input, output_perm=permute_output) # It doesn't need to find an optimized solution, it only needs to do a non-trivial run
                            #print(mode, score)
                            if not permute_input:
                                self.assertListEqual(perms[0].tolist(), [i for i in range(self.n_qubits)])
                            if not permute_output:
                                self.assertListEqual(perms[-1].tolist(), [i for i in range(self.n_qubits)])
                            aggr_c = CNOT_tracker(self.n_qubits)
                            for circ in circuits:
                                for gate in circ.gates:
                                    aggr_c.add_gate(gate)
                                    
                            aggr_c2 = CNOT_tracker(self.n_qubits)
                            # Undo the initial permutation
                            for q1, q2 in permutation_as_swaps({k:v for k,v in enumerate(perms[0])}):
                                aggr_c2.add_gate(CNOT(q1, q2))
                                aggr_c2.add_gate(CNOT(q2, q1))
                                aggr_c2.add_gate(CNOT(q1, q2))
                            for circ in [self.circuit[i] for i in order]:
                                for gate in circ.gates:
                                    aggr_c2.add_gate(gate)
                            #print(aggr_c2.matrix)
                            #print(p)
                            # Undo the initial permutation
                            for q1, q2 in permutation_as_swaps({v:k for k,v in enumerate(perms[-1])}):
                                aggr_c2.add_gate(CNOT(q1, q2))
                                aggr_c2.add_gate(CNOT(q2, q1))
                                aggr_c2.add_gate(CNOT(q1, q2))
                            #if mode == GENETIC_STEINER_MODE:
                            #    print(aggr_c2.matrix)
                            #    print(perms[-1])
                            #    print(aggr_c.matrix)
                            #    print(all([aggr_c2.matrix.data[i][j] == aggr_c.matrix.data[i][j] for i in range(self.n_qubits) for j in range(self.n_qubits)]))
                            #    input("test")
                            self.assertCircuitEquivalent(aggr_c2, aggr_c)
                            for i in range(p):
                                with self.subTest(i=(i, mode)):
                                    """
                                    print(perms[i], perms[i+1])
                                    print(sum([1 for k in range(self.n_qubits) for j in range(self.n_qubits) if matrices[i][perms[i]][:,perms[i+1]][k][j] != circuits[i].matrix.data[k][j]]))  
                                    print(sum([1 for k in range(self.n_qubits) for j in range(self.n_qubits) if c.matrix.data[k][j] != circuits[i].matrix.data[k][j]]))  
                                    print(sum([1 for k in range(self.n_qubits) for j in range(self.n_qubits) if matrices[i][perms[i]][:,perms[i+1]][k][j] != c.matrix.data[k][j]]))  
                                    print(matrices[i])
                                    print()
                                    print(circuits[i].matrix)
                                    print()
                                    print(c.matrix)
                                    print("\n\n")
                                    """
                                    #other_score += c.cnot_depth()*10000+c.count_cnots()
                                    #i==4 and print(other_score)
                                    # Check if all gates are allowed
                                    self.assertGates(circuits[i])  
                                    # Check if the circuit is equivalent to the original matrix
                                    self.assertCircuitEquivalentNdArr(circuits[i], matrices[i][perms[i+1]][:,perms[i]])
                                    # Check if the circuit is equivalent to the extracted circuit given the optimized permutaitons
                                    c, _, _ = self.do_permutated_gaus(np.copy(matrices[i]), perms[i+1], perms[i])
                                    self.assertCircuitEquivalent(circuits[i], c)
                                    # Check if their metrics are the same.
                                    self.assertEqual(circuits[i].count_cnots(), c.count_cnots())
                                    self.assertEqual(circuits[i].cnot_depth(), c.cnot_depth())
                            


if __name__ == '__main__':
    unittest.main()