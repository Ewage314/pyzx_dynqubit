from pyzx.circuit import Circuit
from bidict import bidict
from ..parity_maps import CNOT_tracker


class CombDecomposition(object):
    def __init__(self, comb, hole_plugs):
        self.comb = comb
        self.hole_plugs = hole_plugs

    @staticmethod
    def from_circuit(circuit):
        qubits = circuit.qubits
        gates = circuit.gates
        # Find where the holes are
        open_holes = {} # list of qubits that need to be a virtual qubit to be added eventually
        hole_plugs = {}
        hole_qubit_mappings = bidict()
        moving_qubit_mappings = bidict()
        new_to_old_qubit_mappings = {}
        CNOTs_for_comb = []
        for gate in gates:
            if gate.name != "CNOT":
                # Convert old qubit to new qubit using moving mappings
                if gate.target in moving_qubit_mappings.keys():
                    qubit = moving_qubit_mappings[gate.target]
                else:
                    qubit = gate.target
                # We have found a none CNOT gate
                # Check if it is already considered an open hole
                if qubit not in open_holes.keys():
                # Add it's target qubit as an output for the hole
                    open_holes[qubit] = [gate]
                else:
                    open_holes[qubit].append(gate)
            else:
                # Convert old qubit to new qubit using moving mappings
                if gate.target in moving_qubit_mappings.keys():
                    gate.target = moving_qubit_mappings[gate.target]
                if gate.control in moving_qubit_mappings.keys():
                    gate.control = moving_qubit_mappings[gate.control]

                if gate.target in open_holes.keys() or gate.control in open_holes.keys():
                    for qubit in [gate.target, gate.control]:
                        if qubit in open_holes.keys():
                            hole_qubit_mappings[qubit] = qubits # Creating a new qubit and linking it this one
                            # Check to see if we are mapping a qubit that has already been mapped
                            # Allowing us to have a mapping from the initial qubit to the current one
                            if qubit in moving_qubit_mappings.inverse.keys():
                                temp_dict = bidict({moving_qubit_mappings.inverse.pop(qubit) : qubits})
                                moving_qubit_mappings.update(temp_dict)
                                new_to_old_qubit_mappings.update(temp_dict.inverse)
                            # If this mapping isn't in the moving mapping added
                            if qubit not in moving_qubit_mappings.keys() and qubits not in moving_qubit_mappings.inverse.keys():
                                temp_dict = bidict({qubit: qubits})
                                moving_qubit_mappings.update(temp_dict)
                                new_to_old_qubit_mappings.update(temp_dict.inverse)
                            hole_plugs[hole_qubit_mappings[qubit]] = open_holes.pop(qubit)

                            qubits = qubits + 1

                            # Need to do this again to correct for newly created mappings
                            # Convert old qubit to new qubit using moving mappings
                            if gate.target in hole_qubit_mappings.keys():
                                gate.target = hole_qubit_mappings[gate.target]
                            if gate.control in hole_qubit_mappings.keys():
                                gate.control = hole_qubit_mappings[gate.control]

                CNOTs_for_comb.append(gate)

        # If we have no more gates we need to check we created enough new qubits
        for qubit in list(open_holes.keys()):
            if qubit not in hole_qubit_mappings.keys():
                hole_qubit_mappings[qubit] = qubits
                # Check to see if we are mapping a qubit that has already been mapped
                # Allowing us to have a mapping from the initial qubit to the current one
                if qubit in moving_qubit_mappings.inverse.keys():
                    temp_dict = bidict({moving_qubit_mappings.inverse.pop(qubit) : qubits})
                    moving_qubit_mappings.update(temp_dict)
                    new_to_old_qubit_mappings.update(temp_dict.inverse)
                # If this mapping isn't in the moving mapping added
                if qubit not in moving_qubit_mappings.keys() and qubits not in moving_qubit_mappings.inverse.keys():
                    temp_dict = bidict({qubit: qubits})
                    moving_qubit_mappings.update(temp_dict)
                    new_to_old_qubit_mappings.update(temp_dict.inverse)
                hole_plugs[hole_qubit_mappings[qubit]] = open_holes.pop(qubit)
                qubits = qubits + 1

        # Create CNOTcomb object
        cnot_comb = CNOTComb(qubits, hole_qubit_mappings, new_to_old_qubit_mappings)
        cnot_comb.gates = CNOTs_for_comb
        cnot_comb.update_matrix()

        # Return CombDecomposition object
        return CombDecomposition(cnot_comb, hole_plugs)


    @staticmethod
    def to_circuit(comb_decomposition):
        # Iterate through holes in
        comb = comb_decomposition.comb
        hole_plugs = comb_decomposition.hole_plugs
        holes = comb.holes
        gates = []
        qubits = comb.qubits
        for CNOT_gate in list(comb.gates):
            qubit = None

            new_gates = []
            for side in ["target", "control"]:
                if side == "target":
                    # Check if CNOT comes after a hole
                    if CNOT_gate.target in comb.new_to_old_qubit_mappings.keys():
                        qubit = CNOT_gate.target
                        CNOT_gate.target = comb.new_to_old_qubit_mappings[CNOT_gate.target]
                else:
                    if CNOT_gate.control in comb.new_to_old_qubit_mappings.keys():
                        qubit = CNOT_gate.control
                        CNOT_gate.control = comb.new_to_old_qubit_mappings[CNOT_gate.control]

                # Check if there is a hole plug that hasn't been used yet
                if qubit in hole_plugs.keys():
                    # Need to convert gates back to original qubit
                    new_gates = hole_plugs.pop(qubit) + new_gates
                    # remove a qubit
                    qubits = qubits - 1
                sequential_holes_filled = False
                while not sequential_holes_filled:
                    if qubit in holes.inverse.keys():
                        qubit = holes.inverse[qubit]
                        if qubit in hole_plugs.keys():
                            # Need to convert gates back to original qubit
                            new_gates = hole_plugs.pop(qubit) + new_gates
                            # remove a qubit
                            qubits = qubits - 1
                        else:
                            sequential_holes_filled = True
                    else:
                        sequential_holes_filled = True

            gates = gates + new_gates
            gates.append(CNOT_gate)
        # Add any none CNOT gates that weren't causally before a CNOT
        for qubit in list(hole_plugs.keys()):
            # Need to convert gates back to original qubit
            gates = gates + hole_plugs.pop(qubit)
            # remove a qubit
            qubits = qubits - 1
        circuit = Circuit(qubits)
        circuit.gates = gates
        return circuit


# A CNOT comb is a CNOT circuit with additional causual constraints given by the holes
class CNOTComb(CNOT_tracker):
    def __init__(self, n_qubits, holes, new_to_old_qubit_mappings, **kwargs):
        super().__init__(n_qubits)
        self.holes = holes
        self.new_to_old_qubit_mappings = new_to_old_qubit_mappings
