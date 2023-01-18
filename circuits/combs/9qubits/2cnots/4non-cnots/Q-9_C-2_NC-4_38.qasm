OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[2];
cx q[4], q[2];
x q[8];
x q[2];
x q[7];
cx q[2], q[7];
