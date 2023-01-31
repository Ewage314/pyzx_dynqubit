import sys
from pyzx.generate import cnots as generate_cnots
from pyzx.circuit import Circuit, gate_types
from pyzx.linalg import Mat2
from ..routing.architecture import *

import numpy as np
from bidict import bidict

from ..parity_maps import CNOT_tracker


# We need a CNOT_comb that acts like a CNOT_track but is aware of the holes/virtual qubits
# We need a Hole class to store the gates that are in a hole and where it connects
# Finally we need an encompassing class to store the CNOT_comb and what needs to be filled
# into the holes. This way there is enough info to rebuild the circuit

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

        # Create CombDecomposition object
        comb_decomposition = CombDecomposition(cnot_comb, hole_plugs)

        """
        print(open_holes)
        print(hole_qubit_mappings)
        print(moving_qubit_mappings)
        print(new_to_old_qubit_mappings)
        print(gates)
        print(CNOTs_for_comb)
        print(cnot_comb.matrix)
        print(hole_plugs)
        """

        return comb_decomposition

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



class HolePlug(object):
    def __init__(self, gates, mapping):
        self.gates = gates
        self.mapping = mapping

    def __repr__(self):
        return f"{self.mapping}: {self.gates}"

import pprint


class CombArchitecture(Architecture):
    def __init__(self, arch, comb):
        # Get relavent information from architecture parameter
        name = arch.name
        coupling_graph = arch.graph
        # Extent this information to take account of the additional comb information
        pprint.pprint(coupling_graph.graph)
        coupling_graph.add_vertices(len(comb.holes)) # Add new vertices to the architecture for the virtual qubits
        pprint.pprint(coupling_graph.graph)
        # Add edges for the virtual qubits that are the same as their original qubit
        for virt_qubit in comb.new_to_old_qubit_mappings:
            new_edges = []
            for vert in coupling_graph.graph[comb.new_to_old_qubit_mappings[virt_qubit]]:
                new_edges.append((virt_qubit, vert))
            coupling_graph.add_edges(new_edges)
        pprint.pprint(coupling_graph.graph)
        # Initialise Architecture object
        Architecture.__init__(self, name, coupling_graph=coupling_graph)


class CNOTComb(CNOT_tracker):
    def __init__(self, n_qubits, holes, new_to_old_qubit_mappings, **kwargs):
        super().__init__(n_qubits)
        self.holes = holes
        self.new_to_old_qubit_mappings = new_to_old_qubit_mappings

def rowcol_iteration(matrix, architecture, choice_row, choice_col, rows_to_eliminate, cols_to_eliminate, circuit=None, full_reduce=True, permutation=None, **kwargs):
    debug = None
    """
    Single iteration of algorithm:
    https://arxiv.org/pdf/1910.14478.pdf
    To remove a chosen vertex (qubit)
    """
    def row_add(c0, c1):
        debug and print(f"Row Add : ({c0},{c1})")
        matrix.row_add(c0, c1)
        if circuit: circuit.row_add(c0,c1)

    debug and print(architecture.name)
    # Vertex to remove has been passed as parameter - Step 1

    debug and print("ROW - ", choice_row, rows_to_eliminate)
    debug and print("COL - ", choice_col, cols_to_eliminate)
    debug and print(matrix)

    # Eliminate the column - Step 2-5
    debug and print("Eliminate the column")
    nodes = [i for i, row in enumerate(matrix.data) if row[choice_col] == 1]
    if any([i not in rows_to_eliminate for i in nodes]):
        print("Row not correctly reduced in previous step!")
        print(matrix)
        input('Any key to continue.')
    edges = []
    steiner_tree = architecture.rec_steiner_tree(choice_row, nodes, rows_to_eliminate, [], True)
    edge = next(steiner_tree)
    while edge is not None: # ignore, this is pre-order traversal
        edge = next(steiner_tree)
    edge = next(steiner_tree)
    while edge is not None: #Step 4
        edges.append(edge) # Remember the edges for the next postorder traversal of the tree.
        if matrix.data[edge[1]][choice_col] == 1 and matrix.data[edge[0]][choice_col] == 0:
            row_add(edge[1], edge[0])
        edge = next(steiner_tree)
    for edge in edges: # step 5
        row_add(edge[0], edge[1])

    # Print intermediate matrix
    debug and print(matrix)

    # Eliminate the row - Step 6-10
    debug and print("Eliminate the row")
    #debug and print(matrix)
    # Check if the row is already done to avoid some useless work.
    if sum(matrix.data[choice_row]) > 1:
        # System of linear equations https://stackabuse.com/solving-systems-of-linear-equations-with-pythons-numpy/
        A_ = Mat2(np.array([[matrix.data[row][col] for row in rows_to_eliminate if row != choice_row] for col  in cols_to_eliminate if col != choice_col]))
        B_ = Mat2(np.array([[matrix.data[choice_row][col]] for col in cols_to_eliminate if col != choice_col]))
        A_.gauss(full_reduce=True, x=B_)
        X = A_.data.transpose().dot(B_.data).flatten()

        find_index = lambda i: [j for j in rows_to_eliminate if j != choice_row].index(i)
        nodes = [i for i in rows_to_eliminate if i == choice_row or X[find_index(i)]] # This is S'
        debug and print("System solution - X", X)
        debug and print("Rows to add", nodes)
        debug and print("Pre-calculated outcome of adding those rows.", [ sum([matrix.data[r][c] for r in nodes])%2 for c in cols_to_eliminate])

        steiner_tree = architecture.rec_steiner_tree(choice_row, nodes, rows_to_eliminate, [], True) # step 7
        edge = next(steiner_tree)
        debug and print(f"Edge: {edge}")
        while edge is not None: # step 8
            if edge[1] not in nodes:
                row_add(edge[1], edge[0])
            edge = next(steiner_tree)
        edge = next(steiner_tree)
        while edge is not None: #Step 9
            row_add(edge[1], edge[0])
            edge = next(steiner_tree)

    # Print intermediate matrix
    debug and print(matrix)

    return None

def rowcol(matrix, architecture, circuit=None, full_reduce=True, permutation=None, **kwargs):
    """
    https://arxiv.org/pdf/1910.14478.pdf
    """
    def row_add(c0, c1):
        matrix.row_add(c0, c1)
        if circuit: circuit.row_add(c0,c1)

    debug and print(architecture.name)
    rowcols_to_eliminate = [i for i in range(len(matrix.data))]
    while len(rowcols_to_eliminate) > 1:
        # Pick a vertex to remove - Step 1
        options = architecture.non_cutting_vertices(rowcols_to_eliminate)
        choice = architecture.vertex2qubit(options[0]) # TODO make these choices smarter

        debug and print("ROWCOL - ", choice, rowcols_to_eliminate)
        debug and print(matrix)

        # Eliminate the column - Step 2-5
        debug and print("Eliminate the column")
        nodes = [i for i, row in enumerate(matrix.data) if row[choice] == 1]
        if any([i not in rowcols_to_eliminate for i in nodes]):
            print("Row not correctly reduced in previous step!")
            print(matrix)
            input('Any key to continue.')
        edges = []
        steiner_tree = architecture.rec_steiner_tree(choice, nodes, rowcols_to_eliminate, [], True)
        edge = next(steiner_tree)
        while edge is not None: # ignore, this is pre-order traversal
            edge = next(steiner_tree)
        edge = next(steiner_tree)
        while edge is not None: #Step 4
            edges.append(edge) # Remember the edges for the next postorder traversal of the tree.
            if matrix.data[edge[1]][choice] == 1 and matrix.data[edge[0]][choice] == 0:
                row_add(edge[1], edge[0])
            edge = next(steiner_tree)
        for edge in edges: # step 5
            row_add(edge[0], edge[1])

        # Eliminate the row - Step 6-10
        debug and print("Eliminate the row")
        #debug and print(matrix)
        # Check if the row is already done to avoid some useless work.
        if sum(matrix.data[choice]) > 1:
            # System of linear equations https://stackabuse.com/solving-systems-of-linear-equations-with-pythons-numpy/
            A_inv = Mat2([[matrix.data[row][col] for row in rowcols_to_eliminate if row != choice] for col  in rowcols_to_eliminate if col != choice]).inverse() # np.linalg.inv does not work on boolean matrices.
            B = np.array([matrix.data[choice][col] for col in rowcols_to_eliminate if col != choice])
            X = np.array(A_inv.data).dot(B)%2
            find_index = lambda i: [j for j in rowcols_to_eliminate if j != choice].index(i)
            nodes = [i for i in rowcols_to_eliminate if i == choice or X[find_index(i)]] # This is S'
            debug and print("System solution - X", X)
            debug and print("Rows to add", nodes)
            debug and print("Pre-calculated outcome of adding those rows.", [ sum([matrix.data[r][c] for r in nodes])%2 for c in rowcols_to_eliminate])

            steiner_tree = architecture.rec_steiner_tree(choice, nodes, rowcols_to_eliminate, [], True) # step 7
            edge = next(steiner_tree)
            while edge is not None: # step 8
                if edge[1] not in nodes:
                    row_add(edge[1], edge[0])
                edge = next(steiner_tree)
            edge = next(steiner_tree)
            while edge is not None: #Step 9
                row_add(edge[1], edge[0])
                edge = next(steiner_tree)
        rowcols_to_eliminate.remove(choice) # step 10
    return None
