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
from pyzx.routing.phase_poly import PhasePoly, tpar
from pyzx.circuit import Circuit, HAD, T, CNOT, ZPhase, XPhase
from pyzx.tensor import compare_tensors
from pyzx.routing.architecture import create_architecture
from pyzx.extract import permutation_as_swaps


from pytket.pyzx import pyzx_to_tk
from pytket.backends.ibm import AerStateBackend

SEED = 42

class TestPhasePoly(unittest.TestCase):

    def setUp(self):
        self.n_tests = 10
        self.n_qubits = 9
        name = "line"
        self.architecture = create_architecture(name, n_qubits=self.n_qubits)
        # Define some circuits to work with
        folder = "circuits/steiner/"+str(self.n_qubits)+"qubits/"
        n_cnots = next(os.walk(folder))[1]
        self.circuit = []
        n_phase_layers = 5
        self.n_phase_layers=n_phase_layers
        def filename():
            return os.path.join(*[folder, n_cnots[np.random.choice(len(n_cnots))], 'Original'+str(np.random.choice(20))+".qasm"])
        for _ in range(self.n_tests):
            c = Circuit.from_qasm_file(filename())
            for _ in range(n_phase_layers):
                for i in range(self.n_qubits):
                    if np.random.choice(2, p=[.2, .8]) == 1: # Pick H gate with chance .2
                        phase = np.random.choice([1,-1])*Fraction(1, int(np.random.choice([1,2,4])))
                        c.add_gate(ZPhase(target=i, phase=phase))
                    else:
                        c.add_gate(HAD(target=i))
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
        the_same = compare_tensors(c1, c2)
        self.assertTrue(the_same)
        #return
        # TODO adjust the code below to fit the new pytket version
        tk_circuit1 = pyzx_to_tk(c1)
        tk_circuit2 = pyzx_to_tk(c2)
        try:
            aer_state_b = AerStateBackend()
            compiled1 = aer_state_b.compile_circuit(tk_circuit1)
            compiled2 = aer_state_b.compile_circuit(tk_circuit2)
            statevector1 = aer_state_b.get_state(compiled1)
            statevector2 = aer_state_b.get_state(compiled2)
        except:
            print(tk_circuit1.get_commands())
            print(tk_circuit2.get_commands())
            print("--------- this one")
            exit(42)
        #print("circuit equivalent")
        #print(statevector1)
        #print(statevector2)
        self.assertNdArrEqual(statevector1, statevector2)


    def assertPhasePolyEqual(self, p1, p2):
        #self.assertDictEqual(p1.xphases, p2.xphases)
        self.assertDictEqual(p1.zphases, p2.zphases)
        self.assertListEqual(p1.out_par, p2.out_par)

    def assertPartitionEqual(self, sets, partition):
        flat_partition = [p for subset in partition for p in subset]
        # Are all sets partitioned?
        [self.assertIn(s, flat_partition) for s in sets]
        extra_parities = []
        for p in flat_partition:
            if p not in sets:
                extra_parities.append(p)
        [self.assertTrue(p.count("1")==1) for p in extra_parities] # Only identity rows
        #self.assertCountEqual(extra_parities, list(set(extra_parities))) # No duplicates
        #[self.assertIn(p, sets) for p in flat_partition]
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
                partitions = phase_poly.partition(skip_output_parities=False)
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
                phase_poly_parities = list(phase_poly.zphases.keys()) # + list(phase_poly.xphases.keys())
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

    def test_phase_poly_monomorphism(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                c = Circuit(self.circuit[i].qubits)
                for gate in self.circuit[i].gates:
                    if isinstance(gate, HAD):
                        break
                    c.add_gate(gate)
                self.do_phase_poly(c.copy(), "tket-steiner", self.architecture)

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
        return
        for i in range(self.n_tests):
            with self.subTest(i=i):
                c = Circuit(self.circuit[i].qubits)
                for gate in self.circuit[i].gates:
                    c.add_gate(gate)
                for permute_input, permute_output in [(i,j) for i in [True, False] for j in [True, False]]:
                    with self.subTest(i=(i, permute_input, permute_output)):
                        new_circuit, initial_perm, output_perm = tpar(c, STEINER_MODE, self.architecture, input_perm=permute_input, output_perm=permute_output)
                        adjusted_circuit = self.apply_perms(new_circuit, initial_perm, output_perm)
                        self.assertCircuitEquivalent(c, adjusted_circuit)
    
    def do_phase_poly(self, circuit, mode, architecture, routed=False, tensor_compare=False):
        phase_poly = PhasePoly.fromCircuit(circuit)
        for func in [phase_poly.matroid_synth, phase_poly.gray_synth]:
            with self.subTest(i=func):
                # Check the synthesized circuit
                new_circuit, initial_perm, output_perm = func(mode=mode, architecture=architecture, full_reduce=True)
                if routed:
                    self.assertGates(new_circuit)
                adjusted_circuit = self.apply_perms(new_circuit, initial_perm, output_perm)
                new_phase_poly = PhasePoly.fromCircuit(adjusted_circuit)
                # Check if the phasepolys are the same
                self.assertPhasePolyEqual(phase_poly, new_phase_poly)
                self.assertFinalParityEqual(circuit, adjusted_circuit)
                # Check if the circuits are the same
                self.assertCircuitEquivalent(adjusted_circuit, circuit)
        
    def test_tensor_compare(self):
        n_qubits = 3
        old_qubits = self.n_qubits
        self.n_qubits = n_qubits
        circuit = Circuit(n_qubits)
        n_cnots = 1
        for _ in range(n_cnots):
            circuit.add_gate("CNOT", *np.random.choice(n_qubits, 2, False))
        for i in range(self.n_qubits):
            phase = np.random.choice([1,-1])*Fraction(1, int(np.random.choice([1,2,4])))
            circuit.add_gate(ZPhase(target=i, phase=phase))
        for _ in range(n_cnots):
            circuit.add_gate("CNOT", *np.random.choice(n_qubits, 2, False))
        for i in range(self.n_qubits):
            phase = np.random.choice([1,-1])*Fraction(1, int(np.random.choice([1,2,4])))
            circuit.add_gate(ZPhase(target=i, phase=phase))
        for _ in range(n_cnots):
            circuit.add_gate("CNOT", *np.random.choice(n_qubits, 2, False))
        print("Test circuit")
        for g in circuit.gates:
            print(g)
        self.do_phase_poly(circuit.copy(), STEINER_MODE, None, routed=False, tensor_compare=True)
        self.n_qubits = old_qubits

    def test_phase_poly_creation(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                n_qubits = self.circuit[i].qubits
                circuit = Circuit(n_qubits)
                for gate in self.circuit[i].gates:
                    if isinstance(gate, HAD):
                        break
                    circuit.add_gate(gate)
                # Check if the phase poly is created properly
                phase_poly = PhasePoly.fromCircuit(circuit.copy())
                phase_poly2 = PhasePoly.fromCircuit(circuit.copy())
                self.assertPhasePolyEqual(phase_poly, phase_poly2)
                c1, in1, out1 = phase_poly.matroid_synth(STEINER_MODE, self.architecture, full_reduce=True)
                c2, in2, out2 = phase_poly2.matroid_synth("tket-steiner", self.architecture, full_reduce=True)
                new_c1 = self.apply_perms(c1, in1, out1)
                new_c2 = self.apply_perms(c2, in2, out2)
                self.assertCircuitEquivalent(circuit, new_c1)
                self.assertCircuitEquivalent(circuit, new_c2)
                self.assertCircuitEquivalent(new_c1, new_c2)
    
    def apply_perms(self, circuit, initial_perm, output_perm):
        adjusted_circuit = Circuit(self.n_qubits)
        # Undo the initial permutation
        for q1, q2 in permutation_as_swaps({v:k for k,v in enumerate(initial_perm)}):
            adjusted_circuit.add_gate(CNOT(q1, q2))
            adjusted_circuit.add_gate(CNOT(q2, q1))
            adjusted_circuit.add_gate(CNOT(q1, q2))
        # Do the circuit
        for gate in circuit.gates:
            adjusted_circuit.add_gate(gate)
        # Realise the output permutation
        for q1, q2 in permutation_as_swaps({k:v for k,v in enumerate(output_perm)}):
            adjusted_circuit.add_gate(CNOT(q1, q2))
            adjusted_circuit.add_gate(CNOT(q2, q1))
            adjusted_circuit.add_gate(CNOT(q1, q2))
        return adjusted_circuit

        
                            


if __name__ == '__main__':
    unittest.main()