import numpy as np
import itertools, pickle
from sklearn.ensemble import RandomForestClassifier, ExtraTreesClassifier
from sklearn import tree 
import os

from ..routing.architecture import create_architecture
from ..machine_learning import ProjectiveSimulation
from ..routing.phase_poly import PhasePoly, mat22partition
from ..linalg import Mat2
from ..circuit import Fraction

def main(*args):
    architecture = create_architecture("line", n_qubits=5)
    n_columns_list = [2,3,4]
    for n_columns in n_columns_list:
        print("Phase polynomials with", n_columns, "phase gadgets:")
        features_file = architecture.name + "_features_" + str(n_columns)+".npy"
        label_file = architecture.name + "_labels_" + str(n_columns)+".npy"
        if not os.path.exists(features_file) or not os.path.exists(label_file):
            create_dataset(architecture, n_columns)
        train(architecture, n_columns)

def train(architecture, n_columns):
    n_qubits = architecture.n_qubits
    n_test = 100
    # load data
    print("Loading data")
    data = np.load(architecture.name + "_features_" + str(n_columns)+".npy")
    y = np.load(architecture.name + "_labels_" + str(n_columns)+".npy")
    print("Data samples, polynomial size", y.shape)
    # Train model
    print("Training model")
    model = RandomForestClassifier(n_estimators=100, max_depth=None, n_jobs=-1, oob_score=True)
    #model = ExtraTreesClassifier(n_estimators=100, max_depth=None, n_jobs=-1, oob_score=True)
    #model = tree.DecisionTreeClassifier()
    model = model.fit(data, y)
    with open(architecture.name + "_model_" + str(n_columns)+".pickle", "wb") as f:
        pickle.dump(model, f)
        pass
    # Test model
    if hasattr(model, "oob_score_"):
        print("Oob score:", model.oob_score_)
    else:
        print("Testing model on train data")
        # TODO generate new data for generalisation testing
        n_perfect = 0
        n_better = 0
        n_same = 0
        for features, root_order in zip(data, y):
            # Find the best root order for each phase polynomial by exhaustive search
            parities = features.reshape(n_columns, n_qubits)
            zphase_dict = {"".join([str(int(i)) for i in p]):Fraction(1,4) for p in parities}
            out_parities = mat22partition(Mat2.id(n_qubits))
            # Generate all possible orders
            options = [root_order, model.predict([features])[0], None]
            counts = []
            for i, root_order in enumerate(options):
                phase_poly = PhasePoly(zphase_dict, out_parities, root_order=root_order)
                root_heuristic = "recursive" if root_order is None else "fixed"
                circuit = phase_poly.rec_gray_synth("steiner", architecture, split_heuristic="count", root_heuristic=root_heuristic)[0]
                counts.append(circuit.count_cnots())
            if counts[0] == counts[1]:
                n_perfect += 1
            if counts[1] == counts[2]:
                n_same += 1
            if counts[1] < counts[2]:
                n_better += 1
        print(n_perfect, n_better, n_same)

    n_better = 0
    n_same = 0
    for _ in range(n_test):
        # generate a random phase polynomial
        parities = set([])
        one_qubits = np.random.choice(n_qubits, 2, replace=False)
        while len(parities) < n_columns:
            parity = np.random.choice(["0", "1"], n_qubits)
            for i in one_qubits:
                parity[i] = '1'
            parity = "".join(parity)
            parities.add(parity)
        features = [int(s) for p in parities for s in p ]
        zphase_dict = {"".join([str(int(i)) for i in p]):Fraction(1,4) for p in parities}
        out_parities = mat22partition(Mat2.id(n_qubits))
        # Generate all possible orders
        options = [model.predict([features])[0], None]
        counts = []
        for i, root_order in enumerate(options):
            phase_poly = PhasePoly(zphase_dict, out_parities, root_order=root_order)
            root_heuristic = "recursive" if root_order is None else "fixed"
            circuit = phase_poly.rec_gray_synth("steiner", architecture, split_heuristic="count", root_heuristic=root_heuristic)[0]
            counts.append(circuit.count_cnots())
        if counts[0] == counts[1]:
            n_same += 1
        if counts[0] < counts[1]:
            n_better += 1
    print(n_better, n_same)

        

def create_dataset(architecture, n_columns):
    # Generate training set for phase polynomial root picking.
    print("Creating dataset")
    n_qubits = architecture.n_qubits
    temp = [[0,1]]*(n_qubits - 2)
    parities = np.asarray(list(itertools.product(*temp)))
    data = []
    if n_qubits > 10:
        perm = np.random.permutation(parities) # Drop the full zero parity
        for _ in range(1):
            qubits = np.random.choice(n_qubits, 2, replace=False)
            indices = [j for j in range(n_qubits) if j not in qubits]
            for i in range(0, len(perm)-n_columns, n_columns):
                sample = np.ones((n_columns, n_qubits))
                sample[:, indices] = perm[i:i+n_columns]
                data.append(sample)
    else:
        for _ in range(10):
            qubits = np.random.choice(n_qubits, 2, replace=False)
            indices = [j for j in range(n_qubits) if j not in qubits]
            for _ in range(60):
                parity_choices = np.random.choice(parities.shape[0], n_columns, replace=False)
                sample = np.ones((n_columns, n_qubits), dtype=np.int)
                sample[:, indices] = parities[parity_choices]
                data.append(sample)

    data = np.asarray(data)
    print("Generated phase polynomials of shape:", data.shape)
    y = []
    X = []
    for parities in data:
        # Find the best root order for each phase polynomial by exhaustive search
        zphase_dict = {"".join([str(int(i)) for i in p]):Fraction(1,4) for p in parities}
        out_parities = mat22partition(Mat2.id(n_qubits))
        # Generate all possible orders
        options = list(itertools.product(*([list(range(n_qubits))]*n_columns)))
        best_order = []
        best_count = None
        for root_order in options:
            phase_poly = PhasePoly(zphase_dict, out_parities, root_order=root_order)
            circuit = phase_poly.rec_gray_synth("steiner", architecture, split_heuristic="count", root_heuristic="fixed")[0]
            count = circuit.count_cnots()
            if best_count is None or best_count > count:
                best_count = count
                best_order = [root_order]
            elif best_count == count:
                best_order.append(root_order)
        # Store the best order
        y += best_order
        X += [parities]*len(best_order)
    # Reshape the data to 2D
    data = np.reshape(X, (-1, n_columns*n_qubits))
    # Store the phase polynomial with their best extraction order.
    np.save(architecture.name+"_features_"+str(n_columns), data)
    np.save(architecture.name + "_labels_"+str(n_columns), y)

def main2(*args):
    # TODO add args parser for more options
    architecture = create_architecture("ibm_q20_tokyo")
    n_qubits = architecture.n_qubits
    gamma = 10**-5
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