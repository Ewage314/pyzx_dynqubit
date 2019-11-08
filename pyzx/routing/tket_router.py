from pytket.pyzx import pyzx_to_tk
from pytket._routing import route, Architecture, graph_placement
from pytket._transform import Transform
from pytket import OpType

def route_tket(circuit, architecture):
    tk_circuit = pyzx_to_tk(circuit)
    arch = get_tk_architecture(architecture)
    outcirc = route(tk_circuit, arch)
    Transform.DecomposeSWAPtoCX().apply(outcirc)
    #outcirc.decompose_SWAP_to_CX()
    return outcirc

def get_tk_architecture(architecture):
    coupling_graph = [e for e in architecture.graph.edges()]
    return Architecture(coupling_graph)
    