
import unittest
import sys
if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')
import numpy as np

from pyzx.linalg import Mat2
from pyzx.routing.cnot_mapper import gauss, STEINER_MODE, GAUSS_MODE, GENETIC_STEINER_MODE, PSO_STEINER_MODE, cnot_fitness_func, sequential_gauss
from pyzx.routing.architecture import create_architecture, REC_ARCH, SQUARE, IBMQ_SINGAPORE
from pyzx.parity_maps import CNOT_tracker, build_random_parity_map
from pyzx.machine_learning import GeneticAlgorithm
from pyzx.circuit import CNOT
from pyzx.extract import permutation_as_swaps

SEED = 42

class TestSteiner(unittest.TestCase):

    def setUp(self):
        self.n_tests = 5
        self.arch = create_architecture(IBMQ_SINGAPORE)
        self.n_qubits = self.arch.n_qubits
        depth = 20
        self.circuit = [CNOT_tracker(self.arch.n_qubits) for _ in range(self.n_tests)]
        np.random.seed(SEED)
        self.matrix = [build_random_parity_map(self.n_qubits, depth, self.circuit[i]) for i in range(self.n_tests)]
        self.aggr_circ = CNOT_tracker(self.arch.n_qubits)
        for c in self.circuit:
            for g in c.gates:
                self.aggr_circ.add_gate(g)

    def assertGates(self, circuit):
        for gate in circuit.gates:
            if hasattr(gate, "name") and gate.name == "CNOT":
                edge = (gate.control, gate.target)
                self.assertTrue(edge in self.arch.graph.edges() or tuple(reversed(edge)) in self.arch.graph.edges())

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

    def test_all_cnots_valid(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                circuit = CNOT_tracker(self.arch.n_qubits)
                matrix = Mat2(np.copy(self.matrix[i]))
                _ = gauss(STEINER_MODE, matrix, architecture=self.arch, full_reduce=True, y=circuit)
                self.assertGates(circuit)

    def do_gauss(self, mode, array, full_reduce=True, with_assert=True):
        circuit = CNOT_tracker(self.arch.n_qubits)
        matrix = Mat2(np.copy(array))
        rank = gauss(mode, matrix, architecture=self.arch, full_reduce=full_reduce, y=circuit)
        with_assert and mode == STEINER_MODE and self.assertGates(circuit)
        with_assert and full_reduce and self.assertCircuitEquivalentNdArr(circuit, array)
        return circuit, matrix, rank

    def test_gauss(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                for full_reduce in [False, True]:
                    matrices = []
                    ranks = []
                    circuits = []
                    for mode in [GAUSS_MODE, STEINER_MODE]:
                        circuit, matrix, rank = self.do_gauss(mode, self.matrix[i], full_reduce=full_reduce, with_assert=True)
                        circuits.append(circuit)
                        ranks.append(rank)
                        matrices.append(matrix.data)
                        full_reduce and self.assertCircuitEquivalent(circuit, self.circuit[i])
                    #self.assertEqual(*ranks)
                    if full_reduce:
                        self.assertMat2Equal(*matrices)
                        self.assertCircuitEquivalent(*circuits)
                    else:
                        self.assertMat2Equal(*matrices, triangle=True)

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
        for i in range(self.n_tests):
            with self.subTest(i=i):
                perm = np.random.permutation(self.n_qubits)
                perm2 = np.random.permutation(self.n_qubits)
                self.do_permutated_gaus(self.matrix[i], perm, perm)
                self.do_permutated_gaus(self.matrix[i], perm, perm2)

    def test_genetic_optimization(self):
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
                            print(mode, score)
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