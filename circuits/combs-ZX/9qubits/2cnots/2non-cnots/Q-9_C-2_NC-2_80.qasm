OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[6];
x q[7];
cx q[1], q[7];
cx q[4], q[6];
