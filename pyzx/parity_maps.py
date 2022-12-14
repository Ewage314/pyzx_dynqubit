# PyZX - Python library for quantum circuit rewriting 
#        and optimisation using the ZX-calculus
# Copyright (C) 2019 - Aleks Kissinger, John van de Wetering,
#                      and Arianne Meijer-van de Griend

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

import sys
from pyzx.generate import cnots as generate_cnots
from pyzx.circuit import Circuit, gate_types, CNOT
from pyzx.linalg import Mat2

import numpy as np

class CNOT_tracker(Circuit):
    def __init__(self, n_qubits, parities_as_columns=False, **kwargs):
        super().__init__(n_qubits, **kwargs)
        self.matrix = Mat2.id(n_qubits)
        self.row_perm = np.arange(n_qubits)
        self.col_perm = np.arange(n_qubits)
        self.n_qubits = n_qubits
        self.parities_as_columns = parities_as_columns

    def count_cnots(self):
        return len([g for g in self.gates if hasattr(g, "name") and g.name in ["CNOT", "CZ"]])

    def cnot_depth(self):
        depth = 1
        previous_gates = []
        for g in self.gates:
            if hasattr(g, "name") and g.name in ["CNOT", "CZ"]:
                if g.control in previous_gates or g.target in previous_gates: # Overlapping gate
                    # Start a new CNOT layer
                    previous_gates = [g.control, g.target] 
                    depth += 1
                else:
                    previous_gates += [g.control, g.target]
        return depth

    def row_add(self, q0, q1): #We want to add q0 to q1 
        if self.parities_as_columns: # rowadd(target, control)
            self.add_gate("CNOT", q1, q0)
        else: # rowadd(control, target)
            self.prepend_gate("CNOT", q0, q1)

    def add_gate(self, gate, *args, **kwargs):
        # Do the other gate adding things.
        super().add_gate(gate, *args, **kwargs)
        # Update the parity matrix.
        self.update_matrix()

    
    # A col_add is a row addition on the transpose of the matrix, which is the same as not self.parities_as_columns.
    def col_add(self, q1, q0):
        if not self.parities_as_columns:
            self.add_gate("CNOT", q1, q0)
        else:
            self.prepend_gate("CNOT", q0, q1)
            

    @staticmethod
    def get_metric_names():
        return ["n_cnots", "depth"]

    def gather_metrics(self):
        metrics = {}
        metrics["n_cnots"] = self.count_cnots()
        metrics["depth"] = self.cnot_depth()
        return metrics

    def prepend_gate(self, gate, *args, **kwargs):
        """Adds a gate to the circuit. ``gate`` can either be 
        an instance of a :class:`Gate`, or it can be the name of a gate,
        in which case additional arguments should be given.

        Example::

            circuit.add_gate("CNOT", 1, 4) # adds a CNOT gate with control 1 and target 4
            circuit.add_gate("ZPhase", 2, phase=Fraction(3,4)) # Adds a ZPhase gate on qubit 2 with phase 3/4
        """
        if isinstance(gate, str):
            gate_class = gate_types[gate]
            gate = gate_class(*args, **kwargs)
        self.gates.insert(0, gate)
        self.update_matrix()

    def to_qasm(self):
        qasm = super().to_qasm()
        initial_perm = "// Initial wiring: " + str(self.row_perm.tolist())
        end_perm = "// Resulting wiring: " + str(self.col_perm.tolist())
        return '\n'.join([initial_perm, end_perm, qasm])

    @staticmethod
    def from_circuit(circuit, parities_as_columns=False ):
        new_circuit = CNOT_tracker(circuit.qubits, name=circuit.name, parities_as_columns=parities_as_columns)
        new_circuit.gates = [g for g in circuit.gates]
        new_circuit.update_matrix()
        return new_circuit

    def update_matrix(self):
        self.matrix = Mat2(np.identity(self.n_qubits))
        for gate in self.gates:
            if hasattr(gate, "name") and gate.name == "CNOT":
                if self.parities_as_columns:
                    self.matrix.col_add(gate.control, gate.target)
                else:
                    self.matrix.row_add(gate.control, gate.target)
            else:
                print("Warning: CNOT tracker can only be used for circuits with only CNOT gates!")

    @staticmethod
    def from_qasm_file(fname, parities_as_columns=False):
        circuit = Circuit.from_qasm_file(fname)
        return CNOT_tracker.from_circuit(circuit, parities_as_columns=parities_as_columns)

    def copy(self):
        return CNOT_tracker.from_circuit(self, parities_as_columns=self.parities_as_columns)

def build_random_parity_map(qubits, n_cnots, circuit=None, parities_as_columns=False):
    """
    Builds a random parity map.

    :param qubits: The number of qubits that participate in the parity map
    :param n_cnots: The number of CNOTs in the parity map
    :param circuit: A (list of) circuit object(s) that implements a row_add() method to add the generated CNOT gates [optional]
    :param parities_as_columns: Whether the parities are columns in the map, alternatively they are rows [optional, default=False]
    :return: a 2D numpy array that represents the parity map.
    """
    if circuit is None:
        circuit = []
    if not isinstance(circuit, list):
        circuit = [circuit]
    g = generate_cnots(qubits=qubits, depth=n_cnots)
    c = Circuit.from_graph(g)
    matrix = Mat2(np.identity(qubits))

    for gate in c.gates:
        matrix.row_add(gate.control, gate.target)
        for c in circuit:
            c.add_gate(gate)
    if parities_as_columns:
        matrix = matrix.transpose()
    return matrix.data
