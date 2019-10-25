import unittest
import sys
if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')
import numpy as np

from pyzx.routing.cnot_mapper import GAUSS_MODE
from pyzx.scripts.phase_poly import PhasePoly, tpar
from pyzx.circuit import Circuit, HAD, T
from pyzx.tensor import compare_tensors

SEED = 42

class TestSteiner(unittest.TestCase):

    def setUp(self):
        self.n_tests = 5
        # Define some circuits to work with
        filename = "circuits/steiner/5qubits/5/Original0.qasm"
        self.circuit = Circuit.from_qasm_file(filename)
        for i in range(self.circuit.qubits):
            self.circuit.add_gate(T(target=i))
        self.circuit.add_circuit(Circuit.from_qasm_file("circuits/steiner/5qubits/5/Original1.qasm"))
        for i in range(self.circuit.qubits):
            self.circuit.add_gate(T(target=i))
        self.circuit.add_circuit(Circuit.from_qasm_file("circuits/steiner/5qubits/5/Original2.qasm"))

    def assertPartition(self, sets, partition):
        flat_partition = [p for subset in partition for p in subset]
        # Are all sets partitioned?
        [self.assertIn(s, flat_partition) for s in sets]
        [self.assertIn(p, sets) for p in flat_partition]
        # Is every partition a set of independent parities?
        [self.assertTrue(PhasePoly._independent(None, p)) for p in partition]

    def test_phase_poly(self):
        c = Circuit(self.circuit.qubits)
        for gate in self.circuit.gates:
            if isinstance(gate, HAD):
                break
            c.add_gate(gate)
        self.do_phase_poly(c)

    def test_tpar(self):
        pass

    def do_phase_poly(self, circuit):
        # Check if the phase poly is created properly
        # TODO How?
        phase_poly = PhasePoly.fromCircuit(circuit)
        # Check the paritions
        partitions = phase_poly.partition()
        print(partitions, len(phase_poly.all_parities))
        print(phase_poly.all_parities)
        self.assertPartition(phase_poly.all_parities, partitions)
        print(partitions)
        # Check the synthesized circuit
        new_circuit, initial_perm, output_perm = phase_poly.synthesize(mode=GAUSS_MODE, architecture=None, full_reduce=True)
        print(initial_perm, output_perm)
        the_same = compare_tensors(new_circuit.to_tensor(), circuit.to_tensor())
        self.assertTrue(the_same)
        
                            


if __name__ == '__main__':
    unittest.main()