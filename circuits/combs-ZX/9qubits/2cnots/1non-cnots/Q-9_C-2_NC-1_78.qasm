OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[8];
cx q[0], q[8];
cx q[5], q[0];
