OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[5];
x q[1];
x q[5];
x q[8];
cx q[3], q[8];
cx q[0], q[4];
