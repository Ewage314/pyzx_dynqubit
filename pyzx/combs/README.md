# Quantum Combs

Developing generalisations to circuit synthesis on arbitrary quantum circuits using quantum combs.

There will be a papar on the arxiv soon outlining the utility of the ideas behind this code, as well as containing empirical results generated using it.

## Notebooks
The notebooks are used for prototyping, data generation and general experimentation with the objects and algorithms defined in the .py files.

Notebooks that are marked as 'Deprecated' were used at a previous point for prototyping and testing. However, they are no longer used in the actice development process and can not be guaranteed to run.

### GeneratingCircuits
For testing and demonstration purposes it is useful to have access to a large selection of randomly generated circuits with specific features. This notebook is used to generate those circuits.

### Demonstration
As these algorithms are manipulating quantum circuits it is often useful to display diagrams of those circuits, allowing you to see explicitly, step by step, what is is happening. In this notebook the display features are usually enabled and the circuit resynthesis is conventionally applied to 1 circuit at a time. This helps wehn debugging as you can sometimes see where there is a logical inconsistencing in the algorithm based on the new circuit generated. 

### Benchmarking
The core idea behind using quantum combs is as a replacement to ``slice and build'' when generalising certain resynthesis methods to arbitrary circuits. This notebook runs computational experiments on large numbers of circuits allow comparision between different methods.

## Code
The code is currently broken in to two files, combDefinition and combRouting. 

### combDefinition
This file contains two classes: CombDecomposition and CNOTComb.

  * CNOTComb is very similar to the class used to store CNOT circuits (CNOT_tracker), however it stores the additional causal information of the holes.

  * CombDecomposition stores a comb object and the information of what should go into the holes of that comb. It also includes methods to convert a Circuit into a CombDecomposition object or a CombDecomposition object into a circuit.

Currently the combs are only made of CNOTs and each hole can only have gates for a single qubit. However, there is ongoing to work to extend this to more general combs.

### combRouting
This file contains the necessary functions for a generalisation of the RowCol quantum circuit routing algorithm, that works for quantum combs. Using the ability to convert too and from circuits and quantum combs (as outline in combDefinition), RowCols functionality is extended to allow routing of the CNOT parts of arbitrary circuit without having to the cut the circuit into pieces.
