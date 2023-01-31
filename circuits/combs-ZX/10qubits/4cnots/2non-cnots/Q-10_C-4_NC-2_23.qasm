OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[1], q[7];
cx q[6], q[8];
x q[4];
z q[7];
cx q[0], q[7];
cx q[2], q[9];
