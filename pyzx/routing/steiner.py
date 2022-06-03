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

from pyzx.parity_maps import CNOT_tracker
from . import architecture
from ..linalg import Mat2
import numpy as np # TODO remove after debugging

from queue import PriorityQueue

debug = False

def steiner_gauss(matrix, architecture, full_reduce=False, x=None, y=None, permutation=None):
    """
    Performs Gaussian elimination that is constraint bij the given architecture
    
    :param matrix: PyZX Mat2 matrix to be reduced
    :param architecture: The Architecture object to conform to
    :param full_reduce: Whether to fully reduce or only create an upper triangular form
    :param x: 
    :param y: 
    :return: Rank of the given matrix
    """
    #print(matrix)
    if permutation is None:
        permutation = [i for i in range(len(matrix.data))]
    else:
        matrix = Mat2([[row[i] for i in permutation] for row in matrix.data])
    #print(matrix)
    def row_add(c0, c1):
        matrix.row_add(c0, c1)
        #c0 = permutation[c0]
        #c1 = permutation[c1]
        debug and print("Row addition", c0, c1)
        if x != None: x.row_add(c0, c1)
        if y != None: y.col_add(c1, c0)
    def steiner_reduce(col, root, nodes, upper):
        steiner_tree = architecture.steiner_tree(root, nodes, upper)
        # Remove all zeros
        next_check = next(steiner_tree)
        debug and print("Step 1: remove zeros")
        if upper:
            zeros = []
            while next_check is not None:
                s0, s1 = next_check
                if matrix.data[s0][col] == 0:  # s1 is a new steiner point or root = 0
                    zeros.append(next_check)
                next_check = next(steiner_tree)
            while len(zeros) > 0:
                s0, s1 = zeros.pop(-1)
                if matrix.data[s0][col] == 0:
                    row_add(s1, s0)
                    debug and print(matrix.data[s0][col], matrix.data[s1][col])
        else:
            debug and print("deal with zero root")
            if next_check is not None and matrix.data[next_check[0]][col] == 0:  # root is zero
                print("WARNING : Root is 0 => reducing non-pivot column", matrix.data)
            debug and print("Step 1: remove zeros", [r[c] for r in matrix.data])
            while next_check is not None:
                s0, s1 = next_check
                if matrix.data[s1][col] == 0:  # s1 is a new steiner point
                    row_add(s0, s1)
                next_check = next(steiner_tree)
        # Reduce stuff
        debug and print("Step 2: remove ones")
        next_add = next(steiner_tree)
        while next_add is not None:
            s0, s1 = next_add
            row_add(s0, s1)
            next_add = next(steiner_tree)
            debug and print(next_add)
        debug and print("Step 3: profit")

    rows = matrix.rows()
    cols = matrix.cols()
    p_cols = []
    pivot = 0
    for c in range(cols):
        if pivot < rows:
            nodes = [r for r in range(pivot, rows) if pivot==r or matrix.data[r][c] == 1]
            steiner_reduce(c, pivot, nodes, True)
            if matrix.data[pivot][c] == 1:
                p_cols.append(c)
                pivot += 1
    debug and print("Upper triangle form", matrix.data)
    rank = pivot
    debug and print(p_cols)
    if full_reduce:
        pivot -= 1
        for c in reversed(p_cols):
            debug and print(pivot, [r[c] for r in matrix.data])
            nodes = [r for r in range(0, pivot+1) if r==pivot or matrix.data[r][c] == 1]
            if len(nodes) > 1:
                steiner_reduce(c, pivot, nodes, False)
            pivot -= 1
    return rank


def rec_steiner_gauss(matrix, architecture, circuit=None, full_reduce=True, permutation=None, **kwargs):
    """
    Performs Gaussian elimination that is constraint bij the given architecture according to https://arxiv.org/pdf/1904.00633.pdf
    Only works on full rank, square matrices.
    
    :param matrix: PyZX Mat2 matrix to be reduced
    :param architecture: The Architecture object to conform to
    :param full_reduce: Whether to fully reduce or only create an upper triangular form
    :param x: 
    :param y: 
    """
    #print(matrix)
    if permutation is None:
        permutation = [i for i in range(len(matrix.data))]
    else:
        matrix = Mat2([[row[i] for i in permutation] for row in matrix.data])

    def row_add(c0, c1):
        matrix.row_add(c0, c1)
        if circuit: circuit.row_add(c0,c1)

    def steiner_reduce(col, root, nodes, usable_nodes, rec_nodes, upper):
        if not all([q in usable_nodes for q in nodes]):
            raise Exception("Terminals not in the subgraph "+ str(upper) + str((col, root, nodes, usable_nodes, rec_nodes))+ "\n")
        generator = steiner_reduce_column(architecture, [row[col] for row in matrix.data], root, nodes, usable_nodes, rec_nodes, upper)
        cnot = next(generator, None)
        tree_nodes = []
        while cnot is not None:
            if cnot[0] not in usable_nodes+rec_nodes or cnot[1] not in usable_nodes + rec_nodes:
                raise Exception("Steiner tree not sticking to constraints")
            tree_nodes.extend(cnot)
            row_add(*cnot)
            cnot = next(generator, None)
        return tree_nodes

    def rec_step(qubit_removal_order):
        # size, p_cols and pivot is needed if the matrix isn't square or of full rank
        size = len(qubit_removal_order)
        # Order the rows and columns to be ascending.
        pivots = list(sorted(qubit_removal_order))
        for pivot_idx, c in enumerate(pivots):
            # Get all the nodes in the row below the diagonal (rows[i:]) where the entry equals 1 or it is the diagonal
            nodes = [r for r in pivots[pivot_idx:] if c==r or matrix.data[r][c] == 1] 
            # Perform the steiner_reduce on the current column (c) with root rows2[pivot] and you can use the full matrix
            steiner_reduce(c, c, nodes, pivots[pivot_idx:], [], True)
        #Quick check upper triangular form - should never be printing!
        if not all([all([matrix.data[i][j]== 0 for j in range(0, i)]) for i in range(size)]):
            print("This should never be printed. If you read this, there is a bug around pyzx/routing/steiner.py line 163")
            print()
            print("not upper triangular form?")
            for row in matrix.data:
                print(row)
            print("--------")
        # Full reduce requires the recursion
        if full_reduce:
            # We precalculated the maximal leafs in R (in the qubit_removal_order)
            for i, c in enumerate(qubit_removal_order):
                # Vertices we can still use steiner trees
                usable_nodes = qubit_removal_order[i:] # = R

                # Pick the maximal vertex k in R: k = max(usable_nodes)
                # Pick the maximal leaf k' in R: k' = cols[i] = c
                # Let W be the set of vertices in the shortest path from k' to k (inclusive)
                path = architecture.shortest_path(c, max(usable_nodes))#, usable_nodes) 
                rec_qubits = [architecture.vertex2qubit(v) for v in path]

                # Apply steiner up:
                # Pick the nodes of the steiner tree: all rows with a 1 in column c or the pivot row (diagonal)
                nodes = [r for r in usable_nodes if (r==c or matrix.data[r][c] == 1)]

                if len(nodes) > 1: # Otherwise it is the diagonal, which is trivial/done
                    steiner_reduce(c, c, nodes, usable_nodes, rec_qubits, False)

                # Do recursion on the recursive nodes that were allowed to break the the upper triangular form.
                if len(rec_qubits) > 1: # Trivial otherwise
                    rec_step(list(reversed(rec_qubits)))#[n for n in rows if n in rec_qubits])

    # The qubit order is the order in which the spanning tree R is traversed
    rec_step(architecture.reduce_order)

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

def permrowcol(matrix, architecture, circuit=None, full_reduce=True, chooseRow=None, chooseColumn=None, **kwargs):
    
    def row_add(c0, c1):
        matrix.row_add(c0, c1)
        if circuit: circuit.row_add(c0,c1)

    debug = False
    debug and print(architecture.name)
    cols_to_eliminate = [i for i in range(len(matrix.data))]
    rows_to_eliminate = [i for i in range(len(matrix.data))]
    output_permutation = [None]*len(matrix.data)

    if chooseRow is None:
        # Pick the row with the least ones.
        chooseRow = lambda m, o: o[np.argmin([sum(m.data[i]) for i in o])]

    if chooseColumn is None:
        # Pick the column with a 1 in chosen_row and the least ones in the column
        chooseColumn = lambda m, r, o: o[np.argmin([sum(m.data[:, i]) if m.data[r][i] == 1 else len(m.data) for i in o])] 

    while len(rows_to_eliminate) > 1:
        # Pick a vertex to remove - Step 1
        options = [architecture.vertex2qubit(v) for v in architecture.non_cutting_vertices(rows_to_eliminate)]
        chosen_row = chooseRow(matrix, options)
        # Pick target register for logical qubit choice on original register options[0].
        chosen_column = chooseColumn(matrix, chosen_row, cols_to_eliminate)

        debug and print("ROWCOL - ", chosen_row, chosen_column, rows_to_eliminate, cols_to_eliminate)
        debug and print(matrix)

        # Eliminate the column - Step 2-5
        debug and print("Eliminate the column")
        nodes = [i for i, row in enumerate(matrix.data) if row[chosen_column] == 1]
        debug and print(nodes)
        if any([i not in rows_to_eliminate for i in nodes]):
            print("Row not correctly reduced in previous step!")
            print(matrix)
            input('Any key to continue.')
        edges = []
        steiner_tree = architecture.rec_steiner_tree(chosen_row, nodes, rows_to_eliminate, [], True) 
        edge = next(steiner_tree)
        while edge is not None: # ignore, this is pre-order traversal
            edge = next(steiner_tree)
        edge = next(steiner_tree)
        while edge is not None: #Step 4
            edges.append(edge) # Remember the edges for the next postorder traversal of the tree.
            if matrix.data[edge[1]][chosen_column] == 1 and matrix.data[edge[0]][chosen_column] == 0:
                row_add(edge[1], edge[0])
            edge = next(steiner_tree)
        for edge in edges: # step 5
            row_add(edge[0], edge[1])

        # Eliminate the row - Step 6-10
        debug and print("Eliminate the row")
        debug and print(matrix)
        # Check if the row is already done to avoid some useless work.
        if sum(matrix.data[chosen_row]) > 1:
            # System of linear equations https://stackabuse.com/solving-systems-of-linear-equations-with-pythons-numpy/
            A_inv = Mat2([[matrix.data[row][col] for row in rows_to_eliminate if row != chosen_row] for col  in cols_to_eliminate if col != chosen_column]).inverse() # np.linalg.inv does not work on boolean matrices.
            B = np.array([matrix.data[chosen_row][col] for col in cols_to_eliminate if col != chosen_column])
            X = np.array(A_inv.data).dot(B)%2
            find_index = lambda i: [j for j in rows_to_eliminate if j != chosen_row].index(i) # We will be adding rows together
            nodes = [i for i in rows_to_eliminate if i == chosen_row or X[find_index(i)]] # This is S'
            #debug and print("System solution - X", X)
            #debug and print("Rows to add", nodes)
            #debug and print("Pre-calculated outcome of adding those rows.", [ sum([matrix.data[r][c] for r in nodes])%2 for c in cols_to_eliminate])

            steiner_tree = architecture.rec_steiner_tree(chosen_row, nodes, rows_to_eliminate, [], True) # step 7
            edge = next(steiner_tree)
            while edge is not None: # step 8
                if edge[1] not in nodes:
                    row_add(edge[1], edge[0])
                edge = next(steiner_tree)
            edge = next(steiner_tree)
            while edge is not None: #Step 9
                row_add(edge[1], edge[0])
                edge = next(steiner_tree)
        output_permutation[chosen_row] = chosen_column
        rows_to_eliminate.remove(chosen_row) # step 10
        cols_to_eliminate.remove(chosen_column)
    chosen_row = rows_to_eliminate[0]
    chosen_column = cols_to_eliminate[0]
    output_permutation[chosen_row] = chosen_column
    if matrix.data[chosen_row][chosen_column] != 1:
        print("This should not happen")
    debug and print("FINAL MATRIX\n", matrix)
    debug and print(output_permutation)
    return np.array(output_permutation)

def eliminationStep(matrix, chosen_row, chosen_column, submatrix_rows, submatrix_cols, output_permutation, circuit, path, architecture):
        # Eliminate the column
        nodes = [i for i, row in enumerate(matrix.data) if row[chosen_column] == 1]
        if any([i not in submatrix_rows for i in nodes]):
            print("Row not correctly reduced in previous step!")
            print(matrix)
            input('Any key to continue.')

        edges = []
        steiner_tree = architecture.rec_steiner_tree(chosen_row, nodes, submatrix_rows, [], True) 
        edge = next(steiner_tree)
        while edge is not None: # ignore, this is pre-order traversal
            edge = next(steiner_tree)
        edge = next(steiner_tree)
        while edge is not None: #Step 4
            edges.append(edge) # Remember the edges for the next postorder traversal of the tree.
            if matrix.data[edge[1]][chosen_column] == 1 and matrix.data[edge[0]][chosen_column] == 0:
                matrix.row_add(edge[1], edge[0])
                circuit.row_add(edge[1], edge[0])
            edge = next(steiner_tree)
        for edge in edges: # step 5
            matrix.row_add(edge[0], edge[1])
            circuit.row_add(edge[0], edge[1])
        # Eliminate the row - Step 6-10
        # Check if the row is already done to avoid some useless work.
        if sum(matrix.data[chosen_row]) > 1:
            # System of linear equations https://stackabuse.com/solving-systems-of-linear-equations-with-pythons-numpy/
            A_inv = Mat2([[matrix.data[row][col] for row in submatrix_rows if row != chosen_row] for col  in submatrix_cols if col != chosen_column]).inverse() # np.linalg.inv does not work on boolean matrices.
            B = np.array([matrix.data[chosen_row][col] for col in submatrix_cols if col != chosen_column])
            X = np.array(A_inv.data).dot(B)%2
            find_index = lambda i: [j for j in submatrix_rows if j != chosen_row].index(i) # We will be adding rows together
            nodes = [i for i in submatrix_rows if i == chosen_row or X[find_index(i)]] # This is S'

            steiner_tree = architecture.rec_steiner_tree(chosen_row, nodes, submatrix_rows, [], True) # step 7
            edge = next(steiner_tree)
            edges = []
            while edge is not None: # step 8
                edges.append(edge)
                if edge[1] not in nodes:
                    matrix.row_add(edge[1], edge[0])
                    circuit.row_add(edge[1], edge[0])
                edge = next(steiner_tree)
            edge = next(steiner_tree)
            while edge is not None: #Step 9
                matrix.row_add(edge[1], edge[0])
                circuit.row_add(edge[1], edge[0])
                edge = next(steiner_tree)
        output_permutation[chosen_row] = chosen_column
        return matrix, [r for r in submatrix_rows if r != chosen_row], [c for c in submatrix_cols if c != chosen_column], output_permutation, circuit, path


def A_permrowcol(original_matrix, architecture, choiceWidth=None, max_size=None, parities_as_columns=False):
    debug = False
    debug and print(architecture.name)
    
    n_qubits = len(original_matrix.data)
    if max_size is None:
        if choiceWidth is None:
            max_size = n_qubits^2
        else:
            max_size = choiceWidth^2

    q = PriorityQueue()
    data = (Mat2(np.copy(original_matrix.data)), [i for i in range(n_qubits)], [i for i in range(n_qubits)], [None]*n_qubits, CNOT_tracker(n_qubits, parities_as_columns=parities_as_columns), [])
    q.put(Prioritize(0, data))
    
    while not q.empty():
        m, rows, cols, perm, c, path = q.get().item
        options = [architecture.vertex2qubit(v) for v in architecture.non_cutting_vertices(rows)]
        rowColOptions = [(x[0], x[2]) for x in sorted([ (r,sum(m.data[r]),c,sum(m.data[:, c])) if m.data[r][c] == 1 else (r,sum(m.data[r]),c,len(m.data)) for r in options for c in cols], key=lambda v: v[1]*n_qubits+v[3])] # Sorted from smallest to largest

        if choiceWidth is not None and len(rowColOptions) > choiceWidth:
            rowColOptions = rowColOptions[:choiceWidth]
            
        for chosen_row, chosen_column in rowColOptions:
            if not q.full():
                new_data = eliminationStep(Mat2(np.copy(m.data)), chosen_row, chosen_column, [r for r in rows], [c for c in cols], [p for p in perm], CNOT_tracker.from_circuit(c), [p for p in path] + [(chosen_row, chosen_column)], architecture)
                # Check if solution is found
                if len(new_data[1]) > 1: # If not, continue and put it in the queue
                    priority = new_data[4].count_cnots()
                    q.put(Prioritize(priority, new_data))
                else: # return the solution
                    final_row = new_data[1][0]
                    final_column = new_data[2][0]
                    output_permutation = new_data[3]
                    output_permutation[final_row] = final_column
                    if new_data[0].data[final_row][final_column] != 1:
                        print("This should not happen")
                    return np.array(output_permutation), new_data[4]




def steiner_reduce_column(architecture, col, root, nodes, usable_nodes, rec_nodes, upper):
    steiner_tree = architecture.rec_steiner_tree(root, nodes, usable_nodes, rec_nodes, upper)
    # Remove all zeros
    next_check = next(steiner_tree)
    debug and print("Step 1: remove zeros")
    if upper:
        zeros = []
        while next_check is not None:
            s0, s1 = next_check
            if col[s0] == 0:  # s0 is a new steiner point or root = 0
                #if s0 not in nodes or s0 == root is 0:
                zeros.append(next_check)
            next_check = next(steiner_tree)
        while len(zeros) > 0:
            s0, s1 = zeros.pop(-1) # Reverse order so we go bottom-up
            if col[s0] == 0:
                col[s0] = (col[s1]+col[s0])%2
                yield s1, s0
                debug and print(col[s0], col[s1])
    else:
        debug and print("deal with zero root")
        if next_check is not None and col[next_check[0]] == 0:  # root is zero
            print("WARNING : Root is 0 => reducing non-pivot column", col, next_check[0])
        debug and print("Step 1: remove zeros", col)
        while next_check is not None:
            s0, s1 = next_check
            if col[s1] == 0:  # s1 is a new steiner point
                col[s1] = (col[s1]+col[s0])%2
                yield s0, s1
            next_check = next(steiner_tree)
    # Reduce stuff
    debug and print("Step 2: remove ones")
    next_add = next(steiner_tree)
    while next_add is not None:
        s0, s1 = next_add
        col[s1] = (col[s1]+col[s0])%2
        yield s0, s1
        next_add = next(steiner_tree)
        debug and print(next_add)
    debug and print("Step 3: profit")

    
class Prioritize:
# Workaround for a bug in PriorityQueue https://bugs.python.org/issue31145 that is needed in A_permrowcol

    def __init__(self, priority, item):
        self.priority = priority
        self.item = item

    def __eq__(self, other):
        return self.priority == other.priority

    def __lt__(self, other):
        return self.priority < other.priority