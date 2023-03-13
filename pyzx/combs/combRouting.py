import pyzx as zx
from pyzx.linalg import Mat2
from ..parity_maps import CNOT_tracker
from .combDefinition import *
import numpy as np


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


def next_elimination(qubit_dependence, qubits_in_matrix, arch, rows_to_eliminate):
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

    # Qubits on the topology that haven't been eliminated yet
    rows_to_eliminate = list(range(circ.qubits))
    # Qubits on the comb that haven't eliminated yet
    cols_to_eliminate = list(range(comb.qubits))
    while 0 < len(cols_to_eliminate):
        # Generate sub matrix
        sub_matrix = extract_sub_matrix(matrix, qubits_in_matrix)
        # Circuit to store the changes from this elimination
        sub_circuit = CNOT_tracker(circ.qubits, parities_as_columns=False)
        col_to_eliminate = next_elimination(qubit_dependence, qubits_in_matrix, arch, rows_to_eliminate)
        DEBUG and print(comb.holes)
        DEBUG and print(comb.new_to_old_qubit_mappings)


        # Take account of mapping from virtual to logical qubits
        if col_to_eliminate in comb.new_to_old_qubit_mappings:
            row_to_eliminate = comb.new_to_old_qubit_mappings[col_to_eliminate]
        else:
            row_to_eliminate = col_to_eliminate

        DEBUG and print(f"Qubit to eliminate {col_to_eliminate} ({row_to_eliminate})")

        # Remove current row and column from matrix
        rowcol_iteration(sub_matrix,  # need to generate correct sub matrix
                         arch,
                         row_to_eliminate,  # rowcol needs to 'see' the virtual qubit as the original
                         col_to_eliminate,
                         rows_to_eliminate,  # need to generate list of qubits currently accessible
                         cols_to_eliminate,
                         circuit=sub_circuit)
        DEBUG and print(sub_circuit.gates)

        # Convert the gates of the sub circuit using the mappings
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

        # Remove the qubit that has just been eliminated from the dependencies
        qubit_dependence.pop(col_to_eliminate)
        for qubit in qubit_dependence:
            if col_to_eliminate in qubit_dependence[qubit]:
                qubit_dependence[qubit].remove(col_to_eliminate)

        INNTER_DISPLAY and display(zx.draw(new_comb))

    # Update the decomposition object with the new routed comb
    decomposition.comb = new_comb
    # Convert the decomposition object into a now routed circuit
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
    # Check if the row is already done to avoid some useless work.
    if sum(matrix.data[choice_row]) > 1:
        # System of linear equations https://stackabuse.com/solving-systems-of-linear-equations-with-pythons-numpy/
        # This have been slighly modified form the rowcol in the routing directory to work with rectangular matrices and decoupled rows and columns
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
