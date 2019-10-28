import unittest
import sys, os
if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')
import numpy as np
from fractions import Fraction

from pyzx.routing.cnot_mapper import GAUSS_MODE, PSO_GAUSS_MODE, STEINER_MODE, PSO_STEINER_MODE, GENETIC_STEINER_MODE, GENETIC_GAUSS_MODE
from pyzx.parity_maps import CNOT_tracker
from pyzx.linalg import Mat2
from pyzx.scripts.phase_poly import PhasePoly, tpar
from pyzx.circuit import Circuit, HAD, T, CNOT, ZPhase, XPhase
from pyzx.tensor import compare_tensors
from pyzx.routing.architecture import create_architecture
from pyzx.extract import permutation_as_swaps

SEED = 42

class TestPhasePoly(unittest.TestCase):

    def setUp(self):
        self.n_tests = 10
        self.n_qubits = 5
        name = "line"
        self.architecture = create_architecture(name, n_qubits=self.n_qubits)
        # Define some circuits to work with
        folder = "circuits/steiner/"+str(self.n_qubits)+"qubits/"
        n_cnots = next(os.walk(folder))[1]
        self.circuit = []
        n_phase_layers = 1
        def filename():
            return os.path.join(*[folder, n_cnots[np.random.choice(len(n_cnots))], 'Original'+str(np.random.choice(20))+".qasm"])
        for _ in range(self.n_tests):
            c = Circuit.from_qasm_file(filename())
            for _ in range(n_phase_layers):
                for i in range(self.n_qubits):
                    phase = np.random.choice([1,-1])*Fraction(1, np.random.choice(4)+1)
                    if np.random.choice(2):
                        c.add_gate(ZPhase(target=i, phase=phase))
                    else:
                        c.add_gate(XPhase(target=i, phase=phase))
                c.add_circuit(Circuit.from_qasm_file(filename()))
            self.circuit.append(c)

    def assertGates(self, circuit):
        for gate in circuit.gates:
            if hasattr(gate, "name") and gate.name == "CNOT":
                edge = (gate.control, gate.target)
                self.assertTrue(edge in self.architecture.graph.edges() or tuple(reversed(edge)) in self.architecture.graph.edges())

    def assertMat2Equal(self, m1, m2, triangle=False):
        if triangle:
            self.assertListEqual(*[[m.data[i, j] for i in range(self.n_qubits) for j in range(self.n_qubits) if i >= j] for m in [m1, m2]])
        else:
            self.assertNdArrEqual(m1.data, m2.data)

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

    def assertCircuitEquivalent(self, c1, c2):
        self.assertMat2Equal(c1.matrix.copy(), c2.matrix.copy())

    def assertPhasePolyEqual(self, p1, p2):
        self.assertDictEqual(p1.xphases, p2.xphases)
        self.assertDictEqual(p1.zphases, p2.zphases)
        self.assertListEqual(p1.out_par, p2.out_par)

    def assertPartitionEqual(self, sets, partition):
        flat_partition = [p for subset in partition for p in subset]
        # Are all sets partitioned?
        [self.assertIn(s, flat_partition) for s in sets]
        [self.assertIn(p, sets) for p in flat_partition]
        # Is every partition a set of independent parities?
        [self.assertTrue(PhasePoly._independent(None, p)) for p in partition]

    def assertFinalParityEqual(self, c1, c2):
        old_cnots = CNOT_tracker(c1.qubits)
        new_cnots = CNOT_tracker(c1.qubits)
        for gate in c1.gates:
            if isinstance(gate, CNOT):
                old_cnots.row_add(gate.control, gate.target)
        for gate in c2.gates:
            if isinstance(gate, CNOT):
                new_cnots.row_add(gate.control, gate.target)
        self.assertCircuitEquivalent(old_cnots, new_cnots)
        return old_cnots, new_cnots

    def test_partitions(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                circuit = Circuit(self.circuit[i].qubits)
                for gate in self.circuit[i].gates:
                    if isinstance(gate, HAD):
                        break
                    circuit.add_gate(gate)
                # Check if the phase poly is created properly
                phase_poly = PhasePoly.fromCircuit(circuit)
                # Check the paritions
                partitions = phase_poly.partition()
                self.assertPartitionEqual(phase_poly.all_parities, partitions)

    def test_phase_poly_parity_creation(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                n_qubits = self.circuit[i].qubits
                circuit = Circuit(n_qubits)
                for gate in self.circuit[i].gates:
                    if isinstance(gate, HAD):
                        break
                    circuit.add_gate(gate)
                # Check if the phase poly is created properly
                phase_poly = PhasePoly.fromCircuit(circuit)
                old_cnots = CNOT_tracker(n_qubits)
                for gate in circuit.gates:
                    if isinstance(gate, CNOT):
                        old_cnots.row_add(gate.control, gate.target)
                original_out_par = ["".join([str(v) for v in row]) for row in old_cnots.matrix.data]
                # Check if the output parities are the same
                self.assertListEqual(original_out_par, phase_poly.out_par)

    def test_phase_poly_phase_creation(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                n_qubits = self.circuit[i].qubits
                circuit = Circuit(n_qubits)
                had_phase = False
                for gate in self.circuit[i].gates:
                    if isinstance(gate, HAD):
                        break
                    elif isinstance(gate, ZPhase) or isinstance(gate, XPhase):
                        had_phase = True
                    elif had_phase and isinstance(gate, CNOT):
                        break
                    circuit.add_gate(gate)
                # Check if the phase poly is created properly
                phase_poly = PhasePoly.fromCircuit(circuit)
                old_cnots = CNOT_tracker(n_qubits)
                for gate in circuit.gates:
                    if isinstance(gate, CNOT):
                        old_cnots.row_add(gate.control, gate.target)
                original_out_par = ["".join([str(v) for v in row]) for row in old_cnots.matrix.data]
                # Check if the output parities are the same
                self.assertListEqual(original_out_par, phase_poly.out_par)
                # Check if the original phase poly is the same 
                phase_poly_parities = list(phase_poly.zphases.keys()) + list(phase_poly.xphases.keys())
                for parity in phase_poly_parities:
                    # Check  if all phase poly parities are in the original
                    self.assertIn(parity, original_out_par)

    def test_phase_poly_synthesis(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                c = Circuit(self.circuit[i].qubits)
                for gate in self.circuit[i].gates:
                    if isinstance(gate, HAD):
                        break
                    c.add_gate(gate)
                self.do_phase_poly(c.copy(), GAUSS_MODE, self.architecture)
    
    def test_phase_poly_perm(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                c = Circuit(self.circuit[i].qubits)
                for gate in self.circuit[i].gates:
                    if isinstance(gate, HAD):
                        break
                    c.add_gate(gate)
                self.do_phase_poly(c.copy(), GENETIC_GAUSS_MODE, self.architecture)

    def test_phase_poly_routed(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                c = Circuit(self.circuit[i].qubits)
                for gate in self.circuit[i].gates:
                    if isinstance(gate, HAD):
                        break
                    c.add_gate(gate)
                self.do_phase_poly(c.copy(), STEINER_MODE, self.architecture, routed=True)

    def test_tpar(self):
        pass

    def do_phase_poly(self, circuit, mode, architecture, routed=False):
        phase_poly = PhasePoly.fromCircuit(circuit)
        # Check the synthesized circuit
        new_circuit, initial_perm, output_perm = phase_poly.synthesize(mode=mode, architecture=architecture, full_reduce=True)
        print(initial_perm, output_perm)
        print(permutation_as_swaps({k:v for k,v in enumerate(initial_perm)}))
        print(permutation_as_swaps({k:v for k,v in enumerate(output_perm)}))
        if routed:
            self.assertGates(new_circuit)
        c = Circuit(self.n_qubits)
        for q1, q2 in permutation_as_swaps({k:v for k,v in enumerate(initial_perm)}):
            c.add_gate(CNOT(q1, q2))
            c.add_gate(CNOT(q2, q1))
            c.add_gate(CNOT(q1, q2))
        c.add_circuit(new_circuit)
        for q1, q2 in reversed(permutation_as_swaps({k:v for k,v in enumerate(output_perm)})):
            c.add_gate(CNOT(q1, q2))
            c.add_gate(CNOT(q2, q1))
            c.add_gate(CNOT(q1, q2))
        adjusted_circuit = c
        #new_phase_poly = PhasePoly.fromCircuit(new_circuit, initial_qubit_placement=initial_perm, final_qubit_placement=output_perm)
        new_phase_poly = PhasePoly.fromCircuit(adjusted_circuit)
        # Check if the phasepolys are the same
        self.assertPhasePolyEqual(phase_poly, new_phase_poly)
        self.assertFinalParityEqual(circuit, adjusted_circuit)
        # Check if the tensors are the same
        the_same = compare_tensors(adjusted_circuit, circuit)
        self.assertTrue(the_same)
        
                            


if __name__ == '__main__':
    unittest.main()