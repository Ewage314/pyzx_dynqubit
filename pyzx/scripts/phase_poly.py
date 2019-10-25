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

if __name__ == '__main__':
    print("Please call this as python -m pyzx phasepoly ...")
    exit()

from ..linalg import Mat2
from ..routing.architecture import architectures, SQUARE
from ..routing.cnot_mapper import STEINER_MODE, QUIL_COMPILER, sequential_map_cnot_circuits, elim_modes, compiler_modes
from ..routing.cnot_mapper import sequential_gauss
from ..utils import make_into_list, restricted_float
from ..graph.graph import  Graph
from ..circuit import Circuit, ZPhase, Fraction

description = "Compiles given qasm files or those in the given folder to a given architecture."

import argparse
parser = argparse.ArgumentParser(prog="pyzx phase poly", description=description)
parser.add_argument("QASM_source", nargs='+', help="The QASM file or folder with QASM files to be routed.")
parser.add_argument("-m", "--mode", nargs='+', dest="mode", default=STEINER_MODE, help="The mode specifying how to route. choose 'all' for using all modes.", choices=elim_modes+[QUIL_COMPILER, "all"])
parser.add_argument("-a", "--architecture", nargs='+', dest="architecture", default=SQUARE, choices=architectures, help="Which architecture it should run compile to.")
parser.add_argument("-q", "--qubits", nargs='+', default=None, type=int, help="The number of qubits for the fully connected architecture.")
#parser.add_argument("-f", "--full_reduce", dest="full_reduce", default=1, type=int, choices=[0,1], help="Full reduce")
parser.add_argument("--population", nargs='+', default=10, type=int, help="The population size for the genetic algorithm.")
parser.add_argument("--iterations", nargs='+', default=5, type=int, help="The number of iterations for the genetic algorithm.")
parser.add_argument("--crossover_prob", nargs='+', default=0.8, type=restricted_float, help="The crossover probability for the genetic algorithm. Must be between 0.0 and 1.0.")
parser.add_argument("--mutation_prob", nargs='+', default=0.2, type=restricted_float, help="The mutation probability for the genetic algorithm. Must be between 0.0 and 1.0.")
#parser.add_argument("--perm", default="both", choices=["row", "col", "both"], help="Whether to find a single optimal permutation that permutes the rows, columns or both with the genetic algorithm.")
parser.add_argument("--destination", help="Destination file or folder where the compiled circuit should be stored. Otherwise the source folder is used.")
parser.add_argument("--metrics_csv", default=None, help="The location to store compiling metrics as csv, if not given, the metrics are not calculated. Only used when the source is a folder")
parser.add_argument("--n_compile", default=1, type=int, help="How often to run the Quilc compiler, since it is not deterministic.")
parser.add_argument("--subfolder", default=None, type=str, nargs="+", help="Possible subfolders from the main QASM source to compile from. Less typing when source folders are in the same folder. Can also be used for subfiles.")
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

    sources = make_into_list(args.QASM_source)
    if args.subfolder is not None:
        sources = [os.path.join(source, subfolder) for source in sources for subfolder in args.subfolder if os.path.isdir(source)]
        # Remove non existing paths

    sources = [source for source in sources if os.path.exists(source) or print("Warning, skipping non-existing source:", source)]

    if "all" in args.mode:
        mode = elim_modes + [QUIL_COMPILER]
    else:
        mode = args.mode

    all_circuits = []
    for source in sources:
        print("Mapping qasm files in path:", source)
        circuits = sequential_map_cnot_circuits(source, mode, args.architecture, n_qubits=args.qubits, populations=args.population,
                                           iterations=args.iterations,
                                           crossover_probs=args.crossover_prob, mutation_probs=args.mutation_prob,
                                           dest_folder=args.destination, metrics_file=args.metrics_csv, n_compile=args.n_compile)
        all_circuits.extend(circuits)

class PhasePoly():

    def __init__(self, phase_dict):
        self.phases = phase_dict

    @staticmethod
    def fromCircuit(circuit):
        phases = {}
        current_parities = [x for x in range(circuit.n_qubits)]
        gate_rotations = {"T": Fraction(1,4), "P":Fraction(1,2), "Z":Fraction(1,1), "T_T": Fraction(1,4)*-1, "P_T": Fraction(1,2)*-1}
        for gate in circuit.gates():
            if gate.name == "CNOT":
                # Update current_parities
                #TODO
                pass
            elif gate.name in gate_rotations.keys():
                # Add the T rotation to the phases
                parity = current_parities[gate.target]
                if parity in phases:
                    phases[parity] += gate_rotations[gate.name]
                else: 
                    phases[parity] = gate_rotations[gate.name]
        def clamp(phase):
            new_phase = phase%2
            if new_phase > 1:
                return new_phase -2
            return new_phase
        phases = {par:clamp(r) for par, r in phases.items()}
        return PhasePoly(phases)

    def partition(self):
        # Matroid partitioning based on wikipedia: https://en.wikipedia.org/wiki/Matroid_partitioning
        def add_edge(graph, vs_dict, node1, node2):
            graph.nedges += 1
            graph.graph[vs_dict[node1]][vs_dict[node2]] = 1

        partitions = []
        for parity in self.phases.keys():
            graph = Graph()
            # Add current parity to the graph
            # Add each partition to the graph
            # Add each parity in the partition to the graph
            vs = graph.add_vertices(len(partitions)+sum([len(p) for p in partitions])+1)
            vs_dict = {node:i for i,node in zip(vs, partitions+[e for p in partitions for e in p]+[parity])}
            # Check which parities can be added to another partition
            for partition in partitions:
                # Check if the new parity can be added to the partition
                if self._independent(partition + [parity]):
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
            path = self._dfs([parity, [parity]], graph, vs_dict, {v:k for k,v in vs_dict.items()}, partitions)
            if path != []:
                # Apply those changes if such a path exists
                # Remember which partition to add the final element to
                p_idx = partitions.index(path[-1]) # Last element in the path is always a partition
                for p1, p2 in zip(path[:-1], path[1:]):
                    # Replace p2 with p1 in p1's partition
                    for partition in partitions:
                        if p1 in partition:
                            partition.pop(p1)
                            partition.add(p2)
                partitions[p_idx].add(path[-2])
            else:
                # Make a new partition if no such path exists.
                partitions.append(set(parity))
        return partitions
    
    def _dfs(self, nodes, graph, vs_dict, inv_vs_dict, partitions):
        # recursive dfs to find the shortest path
        if nodes == []:
            return []
        new_nodes = []
        for node, path in nodes:
            # For each node2 connected to node
            for node2 in graph.graph[vs_dict[node]].keys():
                # If it's a partition, we found a path
                next_node = inv_vs_dict[node2]
                if next_node not in path: # Avoid loops!
                    new_path = path + [next_node]
                    if next_node in partitions:
                        return new_path
                    else:
                        new_nodes.append((next_node, new_path))
        return self._dfs(new_nodes, graph, vs_dict, inv_vs_dict, partitions)

    def _independent(self, partition):
        m = Mat2([p for p in partition])
        rank = m.gauss(full_reduce=True, blocksize=3)
        return rank == len(partition)

    def synthesize(self, mode, architecture, **kwargs):
        partitions = self.partition()
        parities = [[parity for parity in partition] for partition in partitions]
        matrices = [Mat2(partition) for partition in parities]
        CNOT_circuits, perms, _ = sequential_gauss(matrices, mode=mode, architecture=architecture, **kwargs)
        circuit = Circuit(architecture.n_qubits)
        for i, partition in enumerate(parities):
            for gate in CNOT_circuits[i].gates:
                circuit.add_gate(gate)
            for target, parity in enumerate(partition):
                target = perms[i+1].index(target)
                phase = self.phases[parity]
                gate = ZPhase(target=target, phase=phase)
                circuit.add_gate(gate)
        return circuit

