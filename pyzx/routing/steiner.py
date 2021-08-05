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

from . import architecture
from ..linalg import Mat2
import numpy as np # TODO remove after debugging

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
        debug and print("Reducing", c0, c1)
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


def rec_steiner_gauss(matrix, architecture, full_reduce=False, x=None, y=None, permutation=None, **kwargs):
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
    #print(matrix)
    def row_add(c0, c1):
        matrix.row_add(c0, c1)
        #c0 = permutation[c0]
        #c1 = permutation[c1]
        debug and print("Reducing", c0, c1)
        c0 = architecture.qubit_map[c0]
        c1 = architecture.qubit_map[c1]
        if x != None: x.row_add(c0, c1)
        if y != None: y.col_add(c1, c0)
    def steiner_reduce(col, root, nodes, usable_nodes, rec_nodes, upper):
        generator = steiner_reduce_column(architecture, [row[col] for row in matrix.data], root, nodes, usable_nodes, rec_nodes, upper)
        cnot = next(generator, None)
        tree_nodes = []
        while cnot is not None:
            tree_nodes.extend(cnot)
            row_add(*cnot)
            cnot = next(generator, None)
        return tree_nodes
    def rec_step(qubit_removal_order):
        # size, p_cols and pivot is needed if the matrix isn't square or of full rank
        size = len(qubit_removal_order)
        p_cols = []
        pivot = 0
        # Order the rows and columns to be ascending.
        rows2 = [r for r in range(len(matrix.data[0])) if r in qubit_removal_order]
        cols2 = [c for c in range(len(matrix.data)) if c in qubit_removal_order]
        for i, c in enumerate(cols2):
            if pivot < size:
                # Get all the nodes in the row below the diagonal (rows[i:]) where the entry equals 1 or it is the diagonal
                nodes = [r for r in rows2[pivot:] if rows2[pivot]==r or matrix.data[r][c] == 1] 
                # Perform the steiner_reduce on the current column (c) with root rows2[pivot] and you can use the full matrix
                steiner_reduce(c, rows2[pivot], nodes, cols2[i:], [], True)
                if matrix.data[rows2[pivot]][c] == 1:
                    p_cols.append(c)
                    pivot += 1
        #Quick check upper triangular form - should never be printing!
        if not all([all([matrix.data[i][j]== 0 for j in range(0, i)]) for i in range(size)]):
            print("This should never be printed. If you read this, there is a bug in pyzx/routing/steiner.py line 163")
            print()
            print("not (upside-down) upper triangular form?")
            for row in matrix.data:
                print(row)
            print("--------")
        # Full reduce requires the recursion
        if full_reduce:
            pivot -= 1
            # Get the rows in the same order as the cols, but backwards because we are going backwards
            rows = [i for i in reversed(qubit_removal_order) if i in rows2]
            for i, c in enumerate(qubit_removal_order):
                if c in p_cols:
                    # Vertices we can still use steiner trees
                    usable_nodes = qubit_removal_order[i:] # = R

                    # Pick the maximal vertex k in R: k = max(usable_nodes)
                    # Pick the maximal leaf k' in R: k' = cols[i] = c
                    # Let W be the set of vertices in the shortest path from k' to k (inclusive)
                    rec_nodes = architecture.shortest_path(c, max(usable_nodes), usable_nodes) 

                    # Apply steiner up:
                    # Pick the nodes of the steiner tree: all rows with a 1 in column c or the pivot row (diagonal)
                    nodes = [r for r in rows if r==rows[pivot] or matrix.data[r][c] == 1]

                    if len(nodes) > 1: # Otherwise it is the diagonal, which is trivial/done
                        steiner_reduce(c, rows[pivot], nodes, usable_nodes, rec_nodes, False)
                        
                    # Do recursion on the recursive nodes that were allowed to break the the upper triangular form.
                    if len(rec_nodes) > 1: # Trivial otherwise
                        rec_step(list(reversed(rec_nodes)))
                pivot -= 1
    # The qubit order is the order in which the spanning tree R is traversed
    qubit_order = architecture.reduce_order
    rec_step(qubit_order)
    #print("Done!")

def steiner_reduce_column(architecture, col, root, nodes, usable_nodes, rec_nodes, upper):
    steiner_tree = architecture.rec_steiner_tree(root, nodes, usable_nodes, rec_nodes, upper)
    # Remove all zeros
    next_check = next(steiner_tree)
    debug and print("Step 1: remove zeros")
    if upper:
        zeros = []
        while next_check is not None:
            s0, s1 = next_check
            if col[s0] == 0:  # s1 is a new steiner point or root = 0
                zeros.append(next_check)
            next_check = next(steiner_tree)
        while len(zeros) > 0:
            s0, s1 = zeros.pop(-1)
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