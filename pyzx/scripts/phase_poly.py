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

import sys, os
import time
import numpy as np
from pandas import DataFrame, concat

if __name__ == '__main__':
    print("Please call this as python -m pyzx phasepoly ...")
    exit()

from pytket.pyzx import pyzx_to_tk
from pytket._routing import route, Architecture, graph_placement
from pytket._transform import Transform
from pytket import OpType

from ..linalg import Mat2
from ..routing.architecture import architectures, SQUARE, create_architecture, dynamic_size_architectures
from ..routing.cnot_mapper import STEINER_MODE, TKET_COMPILER, sequential_map_cnot_circuits, elim_modes, compiler_modes, GENETIC_STEINER_MODE, PSO_STEINER_MODE, GAUSS_MODE
from ..routing.cnot_mapper import sequential_gauss
from ..utils import make_into_list, restricted_float
from ..graph.graph import  Graph
from ..circuit import Circuit, ZPhase, Fraction, HAD, XPhase, CNOT
from ..parity_maps import build_random_parity_map, CNOT_tracker
TKET_STEINER_MODE = "tket-steiner"

description = "Compiles given qasm files or those in the given folder to a given architecture."

import argparse
parser = argparse.ArgumentParser(prog="pyzx phase poly", description=description)
#parser.add_argument("QASM_source", nargs='+', help="The QASM file or folder with QASM files to be routed.")
parser.add_argument("-m", "--mode", nargs='+', dest="mode", default=STEINER_MODE, help="The mode specifying how to route. choose 'all' for using all modes.", choices=[TKET_COMPILER, STEINER_MODE, TKET_STEINER_MODE])
parser.add_argument("-a", "--architecture", nargs='+', dest="architecture", default=SQUARE, choices=architectures, help="Which architecture it should run compile to.")
parser.add_argument("-q", "--qubits", nargs='+', default=None, type=int, help="The number of qubits for the fully connected architecture.")
#parser.add_argument("-f", "--full_reduce", dest="full_reduce", default=1, type=int, choices=[0,1], help="Full reduce")
#parser.add_argument("--population", nargs='+', default=10, type=int, help="The population size for the genetic algorithm.")
#parser.add_argument("--iterations", nargs='+', default=5, type=int, help="The number of iterations for the genetic algorithm.")
#parser.add_argument("--crossover_prob", nargs='+', default=0.8, type=restricted_float, help="The crossover probability for the genetic algorithm. Must be between 0.0 and 1.0.")
#parser.add_argument("--mutation_prob", nargs='+', default=0.2, type=restricted_float, help="The mutation probability for the genetic algorithm. Must be between 0.0 and 1.0.")
#parser.add_argument("--perm", default="both", choices=["row", "col", "both"], help="Whether to find a single optimal permutation that permutes the rows, columns or both with the genetic algorithm.")
#parser.add_argument("--destination", help="Destination file or folder where the compiled circuit should be stored. Otherwise the source folder is used.")
parser.add_argument("--metrics_csv", default=None, help="The location to store compiling metrics as csv, if not given, the metrics are printed.")
#parser.add_argument("--n_compile", default=1, type=int, help="How often to run the Quilc compiler, since it is not deterministic.")
#parser.add_argument("--subfolder", default=None, type=str, nargs="+", help="Possible subfolders from the main QASM source to compile from. Less typing when source folders are in the same folder. Can also be used for subfiles.")
parser.add_argument("-n", "--n_circuits", nargs='+', dest="n", default=20, type=int, help="The number of circuits to generate.")
parser.add_argument("-p", "--n_phase_layers", nargs='+', dest="phase_layers", default=1, type=int, help="Number of layers with phases in the circuits to be generated.")
parser.add_argument("-c", "--cnots_between_layers", nargs='+', dest="cnots", default=5, type=int, help="Number of CNOT gates between each phase layer in the circuits to be generated.")

#TODO add PSO arguments

def main(args):
    args = parser.parse_args(args)
    if args.metrics_csv is not None and os.path.exists(args.metrics_csv):
        delete_csv = None
        text = input("The given metrics file [%s] already exists. Do you want to overwrite it? (Otherwise it is appended) [y|n]" % args.metrics_csv)
        if text.lower() in ['y', "yes"]:
            delete_csv = True
        elif text.lower() in ['n', 'no']:
            delete_csv = False
        while delete_csv is None:
            text = input("Please answer yes or no.")
            if text.lower() in ['y', "yes"]:
                delete_csv = True
            elif text.lower() in ['n', 'no']:
                delete_csv = False
        if delete_csv:
            os.remove(args.metrics_csv)

    #sources = make_into_list(args.QASM_source)
    #if args.subfolder is not None:
    #    sources = [os.path.join(source, subfolder) for source in sources for subfolder in args.subfolder if os.path.isdir(source)]
        # Remove non existing paths

    #sources = [source for source in sources if os.path.exists(source) or print("Warning, skipping non-existing source:", source)]

    if "all" in args.mode:
        mode = elim_modes + [TKET_COMPILER]
    else:
        mode = args.mode

    #all_circuits = [] 
    #for source in sources:
    #    print("Mapping qasm files in path:", source)
    all_results = []
    for a in args.architecture:
        if a in dynamic_size_architectures:
            archs = [create_architecture(a, n_qubits=q) for q in args.qubits]
        else:
            archs = [create_architecture(a)]
        for architecture in archs:
            for n_phase_layers in make_into_list(args.phase_layers):
                for n_cnots_per_layer in make_into_list(args.cnots):
                    print(n_cnots_per_layer, n_phase_layers)
                    for n_circuits in make_into_list(args.n):
                        circuits = [make_random_phase_poly(architecture.n_qubits, n_phase_layers, n_cnots_per_layer, return_circuit=True) for _ in range(n_circuits)]
                        print(circuits[1])
                        print(get_metrics(circuits[1]))
                        results_df = map_phase_poly_circuits(circuits, architecture, mode)
                        results_df["# phase layers"] = n_phase_layers
                        results_df["# cnots per layer"] = n_cnots_per_layer
                        results_df["architecture"] = architecture.name
                        results_df.set_index(["# phase layers","# cnots per layer", "architecture"], inplace=True, append=True)
                        all_results.append(results_df)
    results_df = concat(all_results)
    if args.metrics_csv:
        results_df.to_csv(args.metrics_csv)
    else:
        print(results_df)
                    
def map_phase_poly_circuits(circuits, architecture, modes, **kwargs):
    modes = make_into_list(modes)
    all_results = []
    for mode in modes:
        for i, circuit in enumerate(circuits):
            #print("start", i, mode)
            if mode == TKET_COMPILER:
                results = route_tket(circuit.copy(), architecture)
            else:
                results = route_phase_poly(circuit.copy(), architecture, mode)
            results["idx"] = i
            results["mode"] = mode
            all_results.append(results)
            #print("done", i)
    results_df = concat(all_results)
    results_df.set_index(["idx", "mode"], inplace=True)
    print(results_df)
    return results_df.mean(level="mode")
        
def route_phase_poly(circuit, architecture, mode):
    phase_poly = PhasePoly.fromCircuit(circuit)
    new_circuit = phase_poly.synthesize(mode, architecture, n_steps=5, population=5)[0]
    return get_metrics(new_circuit)

def route_tket(circuit, architecture):
    tk_circuit = pyzx_to_tk(circuit)
    arch = get_tk_architecture(architecture)
    outcirc = route(tk_circuit, arch)
    Transform.DecomposeSWAPtoCX().apply(outcirc)
    #outcirc.decompose_SWAP_to_CX()
    return get_metrics(outcirc)

def get_tk_architecture(architecture):
    coupling_graph = [e for e in architecture.graph.edges()]
    return Architecture(coupling_graph)

def get_metrics(circuit):
    if isinstance(circuit, Circuit):
        tk_circuit = pyzx_to_tk(circuit)
    else:
        tk_circuit = circuit
    metrics = {}
    metrics["CX depth"] = tk_circuit.depth_by_type(OpType.CX)
    metrics["# CX"] = tk_circuit.n_gates_of_type(OpType.CX)
    metrics["Rz depth"] = tk_circuit.depth_by_type(OpType.Rz)
    metrics["# Rz"] = tk_circuit.n_gates_of_type(OpType.Rz)
    return DataFrame([metrics])
    

def make_random_phase_poly(n_qubits, n_phase_layers, cnots_per_layer, return_circuit=False):
    c = CNOT_tracker(n_qubits)
    for _ in range(n_phase_layers):
        build_random_parity_map(n_qubits, cnots_per_layer, circuit=c)
        for i in range(n_qubits):
            phase = np.random.choice([1,-1])*Fraction(1, int(np.random.choice([1,2,4])))
            c.add_gate(ZPhase(target=i, phase=phase))
    if return_circuit:
        return c
    else:
        return PhasePoly.fromCircuit(c)

class PhasePoly():

    def __init__(self, zphase_dict, xphase_dict, out_parities):
        self.zphases = zphase_dict
        self.xphases = xphase_dict
        self.out_par = out_parities
        self.n_qubits = len(out_parities[0])
        self.all_parities = set(list(zphase_dict.keys()) + list(self.xphases.keys()))#+ out_parities)

    @staticmethod
    def fromCircuit(circuit, initial_qubit_placement=None, final_qubit_placement=None):
        zphases = {}
        xphases = {}
        current_parities = ["".join(["1" if j==i else "0" for j in range(circuit.qubits)]) for i in range(circuit.qubits)]
        if initial_qubit_placement is not None:
            current_parities = [current_parities[i] for i in initial_qubit_placement]
        for gate in circuit.gates:
            parity = current_parities[gate.target]
            if gate.name in ["CNOT", "CX"]:
                # Update current_parities
                control = current_parities[gate.control]
                current_parities[gate.target] = "".join([str((int(i)+int(j))%2) for i,j in zip(control, parity)])
            elif isinstance(gate, ZPhase):
                # Add the T rotation to the phases
                if parity in zphases:
                    zphases[parity] += gate.phase
                else: 
                    zphases[parity] = gate.phase
            elif isinstance(gate, XPhase):
                parity = current_parities[gate.target]
                if parity in xphases:
                    xphases[parity] += gate.phase
                else: 
                    xphases[parity] = gate.phase
            else:
                print("Gate not supported!", gate.name)
        def clamp(phase):
            new_phase = phase%2
            if new_phase > 1:
                return new_phase -2
            return new_phase
        zphases = {par:clamp(r) for par, r in zphases.items() if clamp(r) != 0}
        xphases = {par:clamp(r) for par, r in xphases.items() if clamp(r) != 0}
        if final_qubit_placement is not None:
            current_parities = [ current_parities[i] for i in final_qubit_placement]
        return PhasePoly(zphases, xphases, current_parities)

    def partition(self):
        # Matroid partitioning based on wikipedia: https://en.wikipedia.org/wiki/Matroid_partitioning
        def add_edge(graph, vs_dict, node1, node2):
            v1 = [k for k,v in vs_dict.items() if v==node1][0]
            v2 = [k for k,v in vs_dict.items() if v==node2][0]
            graph.nedges += 1
            graph.graph[v1][v2] = 1

        partitions = []
        for parity in self.all_parities:
            graph = Graph()
            # Add current parity to the graph
            # Add each partition to the graph
            # Add each parity in the partition to the graph
            vs = graph.add_vertices(len(partitions)+sum([len(p) for p in partitions])+1)
            vs_dict = {i:node for i,node in zip(vs, partitions+[e for p in partitions for e in p]+[parity])}
            # Check which parities can be added to another partition
            for partition in partitions:
                # Check if the new parity can be added to the partition
                if self._independent(list(partition) + [parity]):
                    add_edge(graph, vs_dict, parity, partition)
                for p in partition:
                    # Check if p can be replaced with the new parity in the partition
                    for partition2 in partitions:
                        if partition2 != partition:
                            for p2 in partition2:
                                # Check if p2 can be replaced with p in their partitions
                                new_partition = [e for e in partition if e != p] + [p2]
                                if self._independent(new_partition):
                                    add_edge(graph, vs_dict, p2, p)
            # Find a path from the parity to a parition
            path = self._dfs([(parity, [parity])], graph, vs_dict, partitions)
            if path != []:
                # Apply those changes if such a path exists
                # Remember which partition to add the final element to
                p_idx = partitions.index(path[-1]) # Last element in the path is always a partition
                for p1, p2 in zip(path[:-1], path[1:]):
                    # Replace p2 with p1 in p1's partition
                    for partition in partitions:
                        if p1 in partition:
                            partition.pop(p1)
                            #partition.add(p2)
                            partition.append(p2)
                partitions[p_idx].append(path[-2])
                #partitions[p_idx].add(path[-2])
            else:
                # Make a new partition if no such path exists.
                partitions.append([parity])
        # TODO - find an optimal ordering of the partitions for synthesis
        ordered_partitions = []
        for partition in partitions:
            # Add identity parities to the partition if the set is not full yet.
            matrix = Mat2([[int(s) for s in parity] for parity in partition])
            matrix, _ = inverse_hack(matrix)
            partition = ["".join([str(i) for i in parity]) for parity in matrix.data]
            new_partition = [None]*self.n_qubits
            skipped_parities = []
            for parity in partition:
                if parity.count("1") == 1:
                    new_partition[parity.index("1")] = parity
                else:
                    skipped_parities.append(parity)
            skipped_idxs = []
            deliberating = []
            for i in range(self.n_qubits):
                if new_partition[i] is None:
                    # Find the best parity in skipped_parities to place there
                    pivotted_parities = [p for p in skipped_parities if p[i] == "1"]
                    if pivotted_parities:
                        pivotted_parities = sorted(pivotted_parities, key=lambda parity: parity.index("1"))
                        if len(pivotted_parities) == 1:
                            chosen = pivotted_parities[0]
                            new_partition[i] = chosen
                            skipped_parities.remove(chosen)
                        else:
                            deliberating.append((i, pivotted_parities))
                    else:
                        skipped_idxs.append(i)
            for i, pivotted_parities in deliberating:
                pivotted_parities = [p for p in pivotted_parities if p in skipped_parities]
                if pivotted_parities:
                    chosen = pivotted_parities[0]
                    new_partition[i] = chosen
                    skipped_parities.remove(chosen)
                else:
                    skipped_idxs.append(i)
            for i in skipped_idxs:
                new_partition[i] = skipped_parities.pop()

            """
            i = 0
            for parity in partition:
                if parity.count("1") != 1:
                    while new_partition[i] is not None:
                        i += 1
                    new_partition[i] = parity
            """
            #while None in new_partition:
            #    new_partition.remove(None)
            ordered_partitions.append(new_partition)
        return ordered_partitions
    
    def _dfs(self, nodes, graph, inv_vs_dict, partitions):
        # recursive dfs to find the shortest path
        if nodes == []:
            return []
        new_nodes = []
        for (node, path) in nodes:
            # For each node2 connected to node
            v = [k for k,v in inv_vs_dict.items() if v==node][0]
            for node2 in graph.graph[v].keys():
                # If it's a partition, we found a path
                next_node = inv_vs_dict[node2]
                if next_node not in path: # Avoid loops!
                    new_path = path + [next_node]
                    if next_node in partitions:
                        return new_path
                    else:
                        new_nodes.append((next_node, new_path))
        return self._dfs(new_nodes, graph, inv_vs_dict, partitions)

    def _independent(self, partition):
        m = Mat2([[int(v) for v in p] for p in partition])
        return inverse_hack(m) is not None

    def synthesize(self, mode, architecture, **kwargs):
        kwargs["full_reduce"] = True
        n_qubits = architecture.n_qubits if architecture is not None else len(self.out_par)
        # Partition the parities
        partitions = self.partition()+[self.out_par]
        parities = [[[int(v) for v in parity] for parity in partition] for partition in partitions]
        # Make the parity sets into matrices
        matrices = [Mat2([p for p in partition]) for partition in parities]
        # The matrices to be computed need to first undo the previous parities and then obtain the new parities
        other_matrices = []
        prev_matrix = Mat2([[1 if i==j else 0 for j in range(n_qubits)] for i in range(n_qubits)])
        for m in matrices:
            new_matrix, inverse = inverse_hack(m)
            other_matrices.append(new_matrix*prev_matrix) 
            prev_matrix = inverse
        if mode == TKET_STEINER_MODE:
            temp_CNOT_circuits, _, _ = sequential_gauss([m.copy() for m in other_matrices], mode=GAUSS_MODE, architecture=architecture, full_reduce=True)
            perms = []
            print(*[c.gates for c in temp_CNOT_circuits], sep="\n")
            print(*other_matrices, sep="\n-------------\n")
            # TODO - this can be made more memory/time efficient by doing it in reverse.
            arch = get_tk_architecture(architecture)
            perm = np.arange(n_qubits)
            for idx in range(len(other_matrices)):
                # Make the partial circuit
                circuit = Circuit(n_qubits)
                for c in temp_CNOT_circuits[idx:]:
                    for g in c.gates:
                        target = perm[g.target] 
                        if isinstance(g, CNOT):
                            #print(g)
                            control = perm[g.control]
                            circuit.add_gate(g.name, control, target)
                        else:
                            circuit.add_gate(g.name, target)
                tk_circuit = pyzx_to_tk(circuit)
                new_perm = graph_placement(tk_circuit, arch)
                perm_dict = {p[1].index[0]: p[0].index[0] for p in new_perm.items()} # TODO - double check if this is not the reverse permutation.
                #print(perm_dict)
                perm2 = [perm_dict[i] if i in perm_dict else None for i in range(n_qubits)]
                print([v for v in new_perm.items()])
                #print(other_matrices[idx])
                #print(perm2)
                perm_idx  = [i for i in range(n_qubits) if perm2[i] is None]
                perm_val = [i for i in range(n_qubits) if i not in perm2]
                for j, v in zip(perm_idx, perm_val):
                    perm2[j] = v
                perm2 = np.asarray(perm2)
                #print(perm2)
                #exit(42)
                #print(perm, perm[perm2])
                #print(other_matrices[idx].rows(), other_matrices[idx].cols())
                #print(Mat2([[other_matrices[idx].data[k][l] for l in perm ] for k in perm[perm2]]))
                #print()
                perm = perm[perm2]
                perms.append(perm)
            perms.append(perms[-1]) # Add the intitial permutation of the last CNOT block as final permutation of the full circuit
            # Rotate all matrices accordingly
            new_matrices = []
            for i, input_perm, output_perm in zip(range(len(temp_CNOT_circuits)), perms, perms[1:]):
                new_matrices.append(Mat2([[other_matrices[i].data[k][l] for l in input_perm] for k in output_perm]))
            print("start")
            print(perms)
            print(*new_matrices, sep="\n-------------\n")
            print("end")
            CNOT_circuits, _, _ = sequential_gauss([m.copy() for m in new_matrices], mode=STEINER_MODE, architecture=architecture, **kwargs)
        else:
            CNOT_circuits, perms, _ = sequential_gauss([m.copy() for m in other_matrices], mode=mode, architecture=architecture, **kwargs)
        zphases = list(self.zphases.keys())
        xphases = list(self.xphases.keys())
        circuit = Circuit(n_qubits)
        # Keep track of the parities
        current_parities = Mat2([[Mat2.id(n_qubits).data[i][perms[0].tolist().index(j)] for j in range(n_qubits)] for i in range(n_qubits)])
        for c in CNOT_circuits:
            # Obtain the specified parity
            for gate in c.gates:
                # CNOTs have been mapped already, do not need to be adjusted!
                circuit.add_gate(gate)
                current_parities.row_add(gate.control, gate.target)
            # Place the rotations at each parity
            for target, p in enumerate(current_parities.data):
                parity = "".join([str(v) for v in p])
                # Apply the phases at current parity if needed.
                if parity in zphases: 
                    phase = self.zphases[parity]
                    gate = ZPhase(target=target, phase=phase)
                    zphases.remove(parity)
                    circuit.add_gate(gate)
                if parity in xphases:
                    phase = self.xphases[parity]
                    gate = XPhase(target=target, phase=phase)
                    xphases.remove(parity)
                    circuit.add_gate(gate)
        return circuit, perms[0], perms[-1]

def tpar(circuit, mode, architecture, input_perm=True, output_perm=True, **kwargs):
    """
    Broken!
    """
    n_qubits = architecture.n_qubits
    current_perm = [i for i in range(n_qubits)]
    initial_perm = current_perm
    c = Circuit(n_qubits)
    final_circuit = Circuit(n_qubits)
    for gate in circuit.gates:
        if gate.name == "HAD":
            # Deal with the phase polynomial that came before
            phase_poly = PhasePoly.fromCircuit(c, initial_qubit_placement=current_perm)
            new_circ, in_perm, out_perm = phase_poly.synthesize(mode, architecture, input_perm=input_perm, output_perm=output_perm, **kwargs)
            # Store the initial permutation
            if input_perm:
                initial_perm = in_perm
                input_perm = False
            # Copy the synthesized circuit
            for g in new_circ.gates:
                final_circuit.add_gate(g)

            # Update new permutation
            current_perm = out_perm
            # Add the hadamard gate
            g = HAD(current_perm[gate.target])
            final_circuit.add_gate(g)
            # Start a new circuit
            c = Circuit(n_qubits)
        else:
            c.add_gate(gate)
    phase_poly = PhasePoly.fromCircuit(c)
    new_circ, in_perm, out_perm = phase_poly.synthesize(mode, architecture, input_perm=input_perm, output_perm=output_perm, **kwargs)
    # Store the initial permutation
    if input_perm:
        initial_perm = in_perm
    # Copy the synthesized circuit
    for g in new_circ.gates:
        final_circuit.add_gate(g)
    return final_circuit, initial_perm, out_perm

def inverse_hack(matrix):
    m = matrix.copy()
    if matrix.rows() != matrix.cols(): 
        # Compute which columns are independent from the matrix
        rank = m.gauss(full_reduce=False)
        cols = []
        row = 0
        for col in range(m.cols()):
            if row >= m.rows() or m.data[row][col] == 0 :
                cols.append(col)
            else:
                row += 1
        # Add those columns as rows to the matrix
        matrix = Mat2(matrix.data + [[1 if c==i else 0 for i in range(m.cols())] for c in cols])
        m = matrix.copy()
    # Compute the inverse
    inv = Mat2.id(matrix.rows())
    rank = m.gauss(x=inv, full_reduce=True)
    if rank < matrix.rows(): return None
    else: return matrix, inv