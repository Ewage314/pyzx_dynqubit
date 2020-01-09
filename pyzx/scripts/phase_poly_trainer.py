import numpy as np

from ..routing.architecture import create_architecture
from ..machine_learning import ProjectiveSimulation
from ..routing.phase_poly import PhasePoly, mat22partition
from ..linalg import Mat2
from ..circuit import Fraction

def main(*args):
    # TODO add args parser for more options
    architecture = create_architecture("ibm_q20_tokyo")
    n_qubits = architecture.n_qubits
    gamma = 10**-3
    phased_training = True
    train = True
    ps = ProjectiveSimulation(3*n_qubits, n_qubits, gamma=gamma)
    n_circuits = 1000
    n_iters = 50
    circuits = []
    if phased_training:
        for i in range(10):
            for _ in range(n_iters):
                count = 0
                average = 0
                same = 0
                average_better = 0
                for _ in range(n_circuits):
                    # Generate a phase polynomial
                    n_parities = i+1 #np.random.choice(i+1)+1
                    parities = set(["".join(np.random.choice(["0", "1"], n_qubits)) for _ in range(n_parities)])
                    zphase_dict = {p:Fraction(1,4) for p in parities}
                    out_parities = mat22partition(Mat2.id(n_qubits))
                    phase_poly = PhasePoly(zphase_dict, out_parities, ps=ps, train=train)
                    circuit = phase_poly.rec_gray_synth("steiner", architecture, split_heuristic="count", root_heuristic="ml")[0]
                    better = phase_poly.rec_gray_synth("steiner", architecture, split_heuristic="count", root_heuristic="recursive")[0].count_cnots() - circuit.count_cnots()
                    if better > 0:
                        count += 1
                        average_better += better
                    elif better == 0:
                        same += 1
                    average += better
                print(i+1, count, same, "\t", average/n_circuits, average_better/count if count > 0 else np.nan)
            #train = False
            #n_iters = 1
    else:
        for _ in range(n_circuits):
            # Generate a phase polynomial
            n_parities = np.random.choice(8)+2
            parities = set(["".join(np.random.choice(["0", "1"], n_qubits)) for _ in range(n_parities)])
            zphase_dict = {p:Fraction(1,4) for p in parities}
            out_parities = mat22partition(Mat2.id(n_qubits))
            phase_poly = PhasePoly(zphase_dict, out_parities, ps=ps, train=True)
            circuits.append(phase_poly)
        for _ in range(n_iters):
            count = 0
            average = 0
            average_better = 0
            for i in np.random.permutation(n_circuits):
                phase_poly = circuits[i]
                circuit = phase_poly.rec_gray_synth("steiner", architecture, split_heuristic="count", root_heuristic="ml")[0]
                better = phase_poly.rec_gray_synth("steiner", architecture, split_heuristic="count", root_heuristic="recursive")[0].count_cnots() - circuit.count_cnots()
                if better > 0:
                    count += 1
                    average_better += better
                average += better
            print(count, "\t", average/n_circuits, average_better/count)



    pass