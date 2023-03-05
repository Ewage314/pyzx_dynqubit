import sys
import pyzx as zx
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


# UTILITY FUNCTIONS FOR COMBROWCOL


def extract_sub_matrix(matrix, index_list):
    new_matrix = Mat2(np.zeros([len(index_list), matrix.cols()], dtype=int))
    for row in range(new_matrix.rows()):
        for col in range(new_matrix.cols()):
            new_matrix.data[row][col] = matrix.data[index_list[row]][col]
    return new_matrix


def insert_sub_matrix(matrix, sub_matrix, index_list):
    for row in range(sub_matrix.rows()):
        for col in range(sub_matrix.cols()):
            matrix.data[index_list[row]][col] = sub_matrix.data[row][col]
    return matrix


def remove_rowcol(matrix, index):
    matrix.data = np.delete(matrix.data, index, 0)
    matrix.data = np.delete(matrix.data, index, 1)
    print(matrix)


def next_elimination(qubit_dependence, qubits_in_matrix, arch, rows_to_eliminate):
    Prn = False

    # Use the qubit_dependence
    possible_eliminations = set(qubit_dependence.keys())
    # It's easier to find all the qubits that can't be eliminated by seeing all the qubits
    # that depend on currently unavailable qubits

    # I need all the elements in possible_eliminations that aren't in qubits_in_matrix
    unavailable_qubits = (possible_eliminations ^ set(qubits_in_matrix)) & possible_eliminations
    # Generate a set of all the qubits that depend on currently unavailable qubits
    impossible_eliminations = unavailable_qubits.copy()
    for q in unavailable_qubits:
        impossible_eliminations = impossible_eliminations.union(qubit_dependence[q])
    # possible_eliminations now becomes all the qubits not in impossible eliminations
    possible_eliminations = possible_eliminations ^ impossible_eliminations
    # Find non-cutting vertices
    non_cutting_vertices = arch.non_cutting_vertices(rows_to_eliminate)
    non_cutting_qubits = [arch.vertex2qubit(v) for v in non_cutting_vertices]
    #print(f"Possible Eliminations : {possible_eliminations}")
    #print(f"Non Cutting Qubits : {non_cutting_qubits}")

    eliminate = np.random.choice([elim for elim in possible_eliminations if (elim >= len(qubits_in_matrix) or elim in non_cutting_qubits)])
    #eliminate = possible_eliminations.pop()
    if Prn:
        print(f"Qubit Dependence : {qubit_dependence}")
        print(f"Qubits in matrix : {qubits_in_matrix}")
        print(f"Impossible Eliminations : {impossible_eliminations}")
        print(f"Eliminate : {eliminate}")
    return eliminate

def next_elimination_matrix(sub_matrix, matrix, qubits_in_matrix, arch, rows_to_eliminate, cols_to_eliminate):
    qubit_found = False
    rows = range(sub_matrix.data.shape[0])
    cols = range(sub_matrix.data.shape[1])
    index = 0
    #print(f"Sub Matrix : \n {sub_matrix}")
    #print(f"Qubits in matrix : \n {qubits_in_matrix}")
    M = sub_matrix.copy()
    M.gauss(full_reduce=True)
    possible_eliminations = []
    # Find non-cutting vertices
    non_cutting_vertices = arch.non_cutting_vertices(rows_to_eliminate)
    non_cutting_qubits = [arch.vertex2qubit(v) for v in non_cutting_vertices]

    for index in range(len(qubits_in_matrix)):
        col = qubits_in_matrix[rows[index]]

        # Check if the 1's in the column of the large matrix for this qubit are all qubits in the sub matrix
        possible_to_eliminate = True
        for k in [i for i in range(sub_matrix.data.shape[0]) if matrix.data[i][col] == 1]:
            if k not in qubits_in_matrix:
                possible_to_eliminate = False
        if possible_to_eliminate:
            if col in cols_to_eliminate:
                # Get all the rows that have a 1 in the desired column
                ones = [r for r in rows if M.data[r][col] == 1]
                # Check that there is only one row with a 1 in it
                if len(ones) == 1:
                    row = ones.pop()
                    # Check that the row only has one one in it
                    if sum([M.data[row][c] for c in cols]) == 1:
                        possible_eliminations.append(col)
    #print(f"M : \n{M}")
    #print(f"Possible Eliminations : {possible_eliminations}")
    eliminate = np.random.choice([elim for elim in possible_eliminations if (elim >= len(qubits_in_matrix) or elim in non_cutting_qubits)])
    return eliminate

def combrowcol(circuit, arch, DEBUG, OUTER_DISPLAY, INNTER_DISPLAY, *args, **kwargs):
    circ = circuit.copy()
    OUTER_DISPLAY and display(zx.draw(circ))
    decomposition = CombDecomposition.from_circuit(circ)
    comb = decomposition.comb
    OUTER_DISPLAY and display(zx.draw(comb))
    new_comb = CNOTComb(comb.qubits, comb.holes.copy(), comb.new_to_old_qubit_mappings)
    # Create a copy of the parity matrix of the comb to perform gaussian elimination on
    matrix = comb.matrix.copy()

    DEBUG and print(comb.matrix)

    # Determine which qubits depend on the availability of other qubits
    qubit_dependence = dict([(i, set()) for i in range(comb.qubits)])
    for gate in comb.gates:
        # Example, gate = CNOT(2,3)
        # Qubit 3 now depends on qubit 2 being available
        # All the qubits that depended on 2 being available now depend on 3 being available
        # Qubit 2 now depends on qubit 3 being available
        # All the qubits that depended on 3 being available now depend on 2 being available
        qubit_dependence[gate.control].add(gate.target)
        qubit_dependence[gate.control] = qubit_dependence[gate.control].union(qubit_dependence[gate.target])
        qubit_dependence[gate.target].add(gate.control)
        qubit_dependence[gate.target] = qubit_dependence[gate.target].union(qubit_dependence[gate.control])

    # Iterate over the gates in the comb and log with qubits are connected via CNOTs
    qubit_connections = dict([(i,[]) for i in range(comb.qubits)])
    for gate in comb.gates:
        # What we want to be doing here is not just adding connected control to target
        # but connecting control to all the qubits connected to target
        for q in qubit_connections[gate.target]:
            if gate.control not in qubit_connections[q] and gate.control != q:
                qubit_connections[q].append(gate.control)
        for q in qubit_connections[gate.control]:
            if gate.target not in qubit_connections[q] and gate.target != q:
                qubit_connections[q].append(gate.target)

        if gate.control not in qubit_connections[gate.target]:
            qubit_connections[gate.target].append(gate.control)
        if gate.target not in qubit_connections[gate.control]:
            qubit_connections[gate.control].append(gate.target)
        #print(f"Gate : {gate}")
        #print(f"Qubit Connections : {qubit_connections}")
        #qubit_connections[gate.target]  = list(set(qubit_connections[gate.target]).union(set(qubit_connections[gate.control])))
        #qubit_connections[gate.control] = list(set(qubit_connections[gate.target]).union(set(qubit_connections[gate.control])))

    #print(comb.matrix)
    #print(f"Gates : {comb.gates}")

    # Find initial qubits for the sub matrix
    qubits_in_matrix = []
    old_to_new_qubits = dict([(i,[]) for i in range(circ.qubits)])
    for virtual_qubit in comb.new_to_old_qubit_mappings.keys():
        old_to_new_qubits[comb.new_to_old_qubit_mappings[virtual_qubit]].append(virtual_qubit)
    for logical_qubit in old_to_new_qubits.keys():
        if len(old_to_new_qubits[logical_qubit]) == 0:
            qubits_in_matrix.append(logical_qubit)
        else:
            qubits_in_matrix.append(max(old_to_new_qubits[logical_qubit]))

    DEBUG and print(qubits_in_matrix)


    # These are the qubits still accessible on the architecture
    # This doesn't include virtual qubits
    rows_to_eliminate = list(range(circ.qubits))
    cols_to_eliminate = list(range(comb.qubits))
    while 0 < len(cols_to_eliminate):

        # Generate sub matrix
        sub_matrix = extract_sub_matrix(matrix, qubits_in_matrix)
        sub_circuit = CNOT_tracker(circ.qubits, parities_as_columns=False)
        col_to_eliminate = next_elimination(qubit_dependence, qubits_in_matrix, arch, rows_to_eliminate)
        #col_to_eliminate = next_elimination_matrix(sub_matrix, matrix, qubits_in_matrix, arch, rows_to_eliminate, cols_to_eliminate)
        DEBUG and print(comb.holes)
        DEBUG and print(comb.new_to_old_qubit_mappings)

        #print(f"Qubit Connections : {qubit_connections}")
        #print(f"Col to eliminate : {col_to_eliminate}")

        # Take account of mapping from virtual to logical qubits
        if col_to_eliminate in comb.new_to_old_qubit_mappings:
            row_to_eliminate = comb.new_to_old_qubit_mappings[col_to_eliminate]
        else:
            row_to_eliminate = col_to_eliminate

        DEBUG and print(f"Qubit to eliminate {col_to_eliminate} ({row_to_eliminate})")

        # Remove current rowcol from matrix
        rowcol_iteration(sub_matrix, # need to generate correct sub matrix
                         arch,
                         row_to_eliminate, # rowcol needs to 'see' the virtual qubit as the original
                         col_to_eliminate,
                         rows_to_eliminate, # need to generate list of qubits currently accessible
                         cols_to_eliminate,
                         circuit=sub_circuit)
        DEBUG and print(sub_circuit.gates)

        # Convert the gates of the sub matrix using the mapping
        for gate in sub_circuit.gates[::-1]:
            gate.control = qubits_in_matrix[gate.control]
            gate.target = qubits_in_matrix[gate.target]
            # Add gates from sub circuit to comb circuit
            new_comb.gates.insert(0, gate)
        # Insert submatrix back into larger matrix
        insert_sub_matrix(matrix, sub_matrix, qubits_in_matrix)

        DEBUG and print(new_comb.gates)

        # If the qubit just removed maps to another qubit via a hole
        # replace that qubit with the new qubit in the qubits_in_matrix list
        qubit_found = False
        qubit_loc = 0
        while not qubit_found:
            qubit = qubits_in_matrix[qubit_loc]
            if qubit == col_to_eliminate:
                qubit_found = True
                # Remove virtual qubit
                cols_to_eliminate.remove(col_to_eliminate)
                # Check if there are anymore virtual qubits that could be assigned to this logical one
                if qubit in comb.holes.inverse.keys():
                    qubits_in_matrix[qubit_loc] = comb.holes.inverse.pop(qubit)
                else:
                    # If no more virtual qubits can be assigned we remove it from being considered
                    # available in the architecture
                    if qubit in comb.new_to_old_qubit_mappings:
                        rows_to_eliminate.remove(comb.new_to_old_qubit_mappings[qubit])
                    else:
                        rows_to_eliminate.remove(qubit)
            qubit_loc += 1
        # Remove the qubit that has just been eliminated from the connections
        qubit_connections[col_to_eliminate] = []
        for qubit in qubit_connections:
            if col_to_eliminate in qubit_connections[qubit]:
                qubit_connections[qubit].remove(col_to_eliminate)

        # Remove the qubit that has just been eliminated from the connections
        qubit_dependence.pop(col_to_eliminate)
        for qubit in qubit_dependence:
            if col_to_eliminate in qubit_dependence[qubit]:
                qubit_dependence[qubit].remove(col_to_eliminate)

        INNTER_DISPLAY and display(zx.draw(new_comb))

    #print(f"Circuit Gates : {circ.gates}")
    #print(f"Comb Gates : {new_comb.gates}")
    #print(f"Holes : {decomposition.hole_plugs}")
    decomposition.comb = new_comb
    new_circuit = CombDecomposition.to_circuit(decomposition)
    OUTER_DISPLAY and display(zx.draw(new_circuit))
    return new_circuit, (matrix.data == np.eye(comb.qubits, dtype=int)).all()

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

# Needs to be removed, just here for comparision for the moment


def rowcol(matrix, architecture, circuit=None, full_reduce=True, permutation=None, **kwargs):
    debug = None
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
