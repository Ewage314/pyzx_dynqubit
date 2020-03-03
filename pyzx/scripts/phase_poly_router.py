import sys, os, re, glob, pickle
import datetime
import numpy as np
from pandas import DataFrame, concat
import subprocess, tempfile

if __name__ == '__main__':
    print("Please call this as python -m pyzx phasepoly ...")
    exit()

from ..routing.architecture import architectures, SQUARE, create_architecture, dynamic_size_architectures, FULLY_CONNNECTED
from ..routing.cnot_mapper import STEINER_MODE, TKET_COMPILER, sequential_map_cnot_circuits, elim_modes, compiler_modes, GENETIC_STEINER_MODE, PSO_STEINER_MODE, GAUSS_MODE, sequential_gauss
from ..routing.phase_poly import route_phase_poly, TKET_STEINER_MODE, make_random_phase_poly_approximate, make_random_phase_poly_from_gadgets, PhasePoly
from ..utils import make_into_list, restricted_float
from ..circuit import Circuit, ZPhase, CNOT
from ..routing.tket_router import pyzx_to_tk, OpType, route_tket, tket_to_pyzx, Transform
from ..parity_maps import CNOT_tracker
from pytket import circuit_from_qasm

TKET_THEN_STEINER_MODE = "tket->steiner"
PHASEPOLY_TKET_MODE = "phase_poly->tket"
STAQ_COMPILER = "staq"


description = "Compiles given qasm files or those in the given folder to a given architecture."

import argparse
parser = argparse.ArgumentParser(prog="pyzx phase poly", description=description)
parser.add_argument("QASM_source", nargs='+', help="The QASM file or folder with QASM files to be routed.")
parser.add_argument("-m", "--mode", nargs='+', dest="mode", default=STEINER_MODE, help="The mode specifying how to route. choose 'all' for using all modes.", choices=[TKET_COMPILER, STEINER_MODE, TKET_STEINER_MODE, TKET_THEN_STEINER_MODE, PHASEPOLY_TKET_MODE, GAUSS_MODE, STAQ_COMPILER])
parser.add_argument("-a", "--architecture", nargs='+', dest="architecture", default=SQUARE, choices=architectures, help="Which architecture it should run compile to.")
parser.add_argument("-q", "--qubits", nargs='+', default=None, type=int, help="The number of qubits for the fully connected architecture.")
#parser.add_argument("--population", nargs='+', default=10, type=int, help="The population size for the genetic algorithm.")
#parser.add_argument("--iterations", nargs='+', default=5, type=int, help="The number of iterations for the genetic algorithm.")
#parser.add_argument("--crossover_prob", nargs='+', default=0.8, type=restricted_float, help="The crossover probability for the genetic algorithm. Must be between 0.0 and 1.0.")
#parser.add_argument("--mutation_prob", nargs='+', default=0.2, type=restricted_float, help="The mutation probability for the genetic algorithm. Must be between 0.0 and 1.0.")
#parser.add_argument("--perm", default="both", choices=["row", "col", "both"], help="Whether to find a single optimal permutation that permutes the rows, columns or both with the genetic algorithm.")
#parser.add_argument("--destination", help="Destination file or folder where the compiled circuit should be stored. Otherwise the source folder is used.")
parser.add_argument("--metrics_csv", default=None, help="The location to store compiling metrics as csv, if not given, the metrics are printed.")
#parser.add_argument("--n_compile", default=1, type=int, help="How often to run the Quilc compiler, since it is not deterministic.")
parser.add_argument("--subfolder", default=None, type=str, nargs="+", help="Possible subfolders from the main QASM source to compile from. Less typing when source folders are in the same folder. Can also be used for subfiles.")
parser.add_argument("--raw", default=False, type=bool, help="Whether the results should be raw or aggregated with mean/median/min/max")
parser.add_argument("--notes", default="", type=str, help="Extra notes that can be added to the csv")
parser.add_argument("--placement", default=True, type=bool, help="Whether tket should optimize placement")
parser.add_argument("--matroid", nargs='+', default="gray", choices=["matroid", "gray", "arianne", "both"], help="Whether the algorithm should use matroid partitioning for synthesis, otherwise it uses gray synth.")
parser.add_argument("--root_heuristic", nargs='+', default="recursive", choices=["recursive", "nash", "random", "exhaustive", "arity", "model"], help="Which root heuristic should be used by gray synth")
parser.add_argument("--split_heuristic", nargs='+', default="count", choices=["random", "count", "arity", "count->arity"], help="Which split heuristic should be used by gray synth")
#parser.add_argument("--zeroes_first", nargs='+', default=True, type=bool, help="Whether the recursive gray synth should recurse on zeroes first or not.")
#parser.add_argument("-n", "--n_circuits", nargs='+', dest="n", default=20, type=int, help="The number of circuits to generate.")
#parser.add_argument("-p", "--n_phase_layers", nargs='+', dest="phase_layers", default=1, type=int, help="Number of layers with phases in the circuits to be generated.")
#parser.add_argument("-c", "--cnots_between_layers", nargs='+', dest="cnots", default=5, type=int, help="Number of CNOT gates between each phase layer in the circuits to be generated.")
parser.add_argument("--density", nargs='+', type=float, help="The density probability for the dynamic_density architecture")

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
        print(args.subfolder)
        if args.subfolder == ["."]:
            sources = [os.path.join(d, o) for d in sources for o in os.listdir(d) 
                    if os.path.isdir(os.path.join(d,o))]
        else:
            sources = [os.path.join(source, subfolder) for source in sources for subfolder in args.subfolder if os.path.isdir(source)]
        # Remove non existing paths

    sources = [source for source in sources if os.path.exists(source) or print("Warning, skipping non-existing source:", source)]
    sources = [os.path.join(source, f) for source in sources for f in os.listdir(source)]
    sources = [source for source in sources if os.path.isfile(source)]
    circuits = [Circuit.from_qasm_file(f) for f in sources]
    
    if circuits == []:
        n_circuits = int(input("No files found, how many circuits should be generated?"))
        n_gadgets = [int(s) for s in input("How many cnots,phases should these circuits have? (space separate for multiple)").split(" ") if s != ""]
        #n_gadgets = [[int(i) for i in s.split(",")] for s in input("How many cnots,phases should these circuits have? (space separate for multiple)").split(" ") if s != ""]
        gen_circuits = {}
    else:
        gen_circuits = None

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
            if a == "dynamic_density":
                archs = [create_architecture(a, n_qubits=q, density_prob=d) for q in args.qubits for d in args.density]
            else:
                archs = [create_architecture(a, n_qubits=q) for q in args.qubits]
        else:
            archs = [create_architecture(a)]
        for architecture in archs:
            if gen_circuits is not None:
                if architecture.n_qubits not in gen_circuits:
                    print("generating circuits for q=", architecture.n_qubits)
                    phase_polies = [make_random_phase_poly_from_gadgets(architecture.n_qubits, g, False) for g in n_gadgets for _ in range(n_circuits)]
                    #gen_circuits[architecture.n_qubits] = [phase_poly.rec_gray_synth(GAUSS_MODE, architecture, root_heuristic="nash")[0] for phase_poly in phase_polies]
                    gen_circuits[architecture.n_qubits] = phase_polies
                    #gen_circuits[architecture.n_qubits] = [make_random_phase_poly_approximate(architecture.n_qubits, cnots, phases, True) for cnots, phases in n_gadgets for _ in range(n_circuits)]
                circuits = gen_circuits[architecture.n_qubits]
            print("Synthesising circuits for architecture ", architecture.name)
            root_heurs = make_into_list(args.root_heuristic)
            split_heurs = make_into_list(args.split_heuristic)
            synthesis_method = make_into_list(args.matroid)
            for method in synthesis_method:
                if method in ["matroid", "arianne"]:
                    root_heurs2 = [""]
                    split_heurs2 = [""]
                else:
                    root_heurs2 = root_heurs
                    split_heurs2 = split_heurs
                for root_heuristic in root_heurs2:
                    models = None
                    if root_heuristic == "model":
                        models = [pickle.load(open(filename, "rb")) for filename in glob.glob(architecture.name +"_model_"+"*.pickle")]
                    for split_heuristic in split_heurs:
                            if method == "arianne" and len(synthesis_method) > 1:
                                m = ["steiner"]
                            else:
                                m = mode
                            if sources != []:
                                files = sources
                            else:
                                print(circuits)
                                files = ["GENERATED" for _ in circuits]
                            results_df = map_phase_poly_circuits(circuits, architecture, m, files, do_matroid=method, root_heuristic=root_heuristic, split_heuristic=split_heuristic, models=models)
                            if not args.raw:
                                kwargs = {"level":["mode", "#cnots_per_layer", "#phase_layers"]}
                                results_df = concat([results_df.mean(**kwargs).add_suffix("_mean"), 
                                                    results_df.median(**kwargs).add_suffix("_median"), 
                                                    results_df.min(**kwargs).add_suffix("_min"), 
                                                    results_df.max(**kwargs).add_suffix("_max")], axis=1)
                                #results_df["# phase layers"] = n_phase_layers
                                #results_df["# cnots per layer"] = n_cnots_per_layer
                                #results_df["architecture"] = architecture.name
                                #results_df.set_index(["# phase layers","# cnots per layer", "architecture"], inplace=True, append=True)
                            matches = [re.search('/(\d+)layers(\d+)cnots', file) for file in files]
                            #results_df["file"] = files
                            #results_df["#phase_layers"], results_df["#cnots_per_layer"] = zip(*[(None, None) if match is None else (int(match.group(1)),int(match.group(2))) for match in matches])
                            #if match is not None:
                            #    results["#phase_layers"] = int(match.group(1))
                            #    results["#cnots_per_layer"] = int(match.group(2))
                            #else:
                            #    results["#phase_layers"] = None
                            #    results["#cnots_per_layer"] = None
                            results_df["notes"] = args.notes 
                            results_df["matroid"] = method
                            results_df["root_heuristic"] = root_heuristic
                            results_df["split_heuristic"] = split_heuristic 
                            results_df["arch_density"] = architecture.density
                            results_df["architecture"] = architecture.name
                            results_df.set_index(["idx", "mode", "file"], inplace=True, append=True)
                            all_results.append(results_df)
                if args.metrics_csv and all_results != []:
                    final_df = concat(all_results)
                    if os.path.exists(args.metrics_csv):
                        with open(args.metrics_csv, 'a') as f:
                            final_df.to_csv(f, header=False)
                    else:
                        final_df.to_csv(args.metrics_csv)
                    all_results = []
    if not args.metrics_csv and all_results != []:
        df = concat(all_results)
        df.reset_index(inplace=True)
        df["file"] = df["file"].str.replace("circuits/phasepoly/gadgets/20qubits/5gadgets/", "",regex=True)
        print(df)
        print(df.time)
         

def map_phase_poly_circuits(circuits, architecture, modes, files, placement=True, **kwargs):
    modes = make_into_list(modes)
    all_results = []
    tket_initial_mapping = None if placement else [i for i in range(architecture.n_qubits)]
    for mode in modes:
        for i, (circuit, file) in enumerate(zip(circuits, files)):
            print("Synthesising:", i, mode, file)
            t = datetime.datetime.now()
            if mode == TKET_COMPILER or mode == TKET_THEN_STEINER_MODE:
                a = architecture if mode == TKET_COMPILER else create_architecture(FULLY_CONNNECTED, n_qubits=architecture.n_qubits)
                if isinstance(circuit, PhasePoly):
                    circuit = circuit.to_tket()
                else:
                    circuit = PhasePoly.fromCircuit(circuit).to_tket()
                c = route_tket(circuit, a, initial_mapping=tket_initial_mapping)
            elif mode == STAQ_COMPILER:
                if file != "GENERATED":
                    device_map = {
                        "rigetti_16q_aspen": "aspen-4",
                        "9q-square":"square",
                        "ibm_q20_tokyo":"tokyo",
                        "9q-fully_connected":"fullcon",
                        "rigetti_8q_agave":"agave",
                        "ibmq_singapore":"singapore"
                    }
                    if architecture.name in device_map.keys():
                        device = device_map[architecture.name]
                        s = subprocess.check_output(" ".join(["./staq -M swap -m -d", device, file]), shell=True)
                        s = s.decode("utf-8")
                        s = s.replace("U", "u3")
                        s = s.replace("CX", "cx")
                        fp = tempfile.NamedTemporaryFile(suffix=".qasm")
                        fp.write(s.encode('utf-8'))
                        fp.seek(0) #Place the pointer back at the start of the file
                        try:
                            c = circuit_from_qasm(fp.name)
                        except TypeError as e:
                            print(s)
                            raise e
                        fp.close() #Remove the temporary file from memory
                        Transform.OptimisePostRouting().apply(c)
                    else:
                        raise NotImplementedError("Architecture currently not implemented in staq", architecture.name)
                else: 
                    raise NotImplementedError("Can only parse existing qasm files with Staq atm.")
            elif mode == PHASEPOLY_TKET_MODE or mode == GAUSS_MODE:
                c = route_phase_poly(circuit, architecture, GAUSS_MODE, **kwargs)
            else:
                c = route_phase_poly(circuit, architecture, mode, n_steps=5, population=5, **kwargs)
            if mode == PHASEPOLY_TKET_MODE:
                c = route_tket(c, architecture, initial_mapping=tket_initial_mapping)
            elif mode == TKET_THEN_STEINER_MODE:
                # TODO split the circuit c into CNOT sections and route that sequential steiner gauss
                matrices, phases = zip(*tket_to_cnots(c))
                circuits, _, _ = sequential_gauss([m.copy() for m in matrices], mode=STEINER_MODE, architecture=architecture, full_reduce=True)
                c = Circuit(architecture.n_qubits)
                for circuit, p in zip(circuits, phases):
                    for gate in circuit.gates:
                        c.add_gate(gate)
                    for phase in p:
                        c.add_gate(phase)
            t = datetime.datetime.now() - t
            print("done", t)
            #original_CNOTs = get_metrics(circuit).add_prefix("Original ")
            results = get_metrics(c)
            results["time"] = t
            results["idx"] = i
            results["mode"] = mode 
            results["file"] = file
            #results = results.join(original_CNOTs)
            all_results.append(results)
            #print("done", i, datetime.datetime.now() - t)
    results_df = concat(all_results)
    return results_df

def get_metrics(circuit):
    metrics = {}
    n_gadgets = None
    if isinstance(circuit, Circuit):
        tk_circuit = pyzx_to_tk(circuit)
        Transform.OptimisePostRouting().apply(tk_circuit)
        if hasattr(circuit, "n_gadgets"):
            n_gadgets = circuit.n_gadgets
    else:
        tk_circuit = circuit
    metrics["# Gadgets"] = n_gadgets
    metrics["CX depth"] = tk_circuit.depth_by_type(OpType.CX)
    metrics["# CX"] = tk_circuit.n_gates_of_type(OpType.CX)
    metrics["Rz depth"] = tk_circuit.depth_by_type(OpType.U1)
    metrics["depth"] = tk_circuit.depth()
    metrics["# Rz"] = tk_circuit.n_gates_of_type(OpType.U1)
    return DataFrame([metrics])

def tket_to_cnots(circuit):
    cnots = CNOT_tracker(circuit.n_qubits)
    phases = []
    split_gates = []
    for gate in circuit.get_commands():
        if gate.op.get_type() == OpType.Rz:
            phases.append(ZPhase(gate.qubits[0].index[0], gate.op.get_params()[0]))
        elif gate.op.get_type() == OpType.CX:
            if phases != []:   
                split_gates.append((cnots.matrix, phases))
                cnots = CNOT_tracker(circuit.n_qubits)
                phases = []             
            cnots.add_gate(CNOT(gate.qubits[0].index[0], gate.qubits[1].index[0]))
        else:
            print("Warning: gate not supported, skipping", gate)
    split_gates.append((cnots.matrix, phases))
    return split_gates