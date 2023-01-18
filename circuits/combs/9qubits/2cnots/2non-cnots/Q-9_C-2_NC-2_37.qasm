OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[6];
x q[1];
cx q[0], q[8];
cx q[8], q[6];
