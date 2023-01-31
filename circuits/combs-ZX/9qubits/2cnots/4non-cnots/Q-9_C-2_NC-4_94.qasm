OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[3];
z q[8];
cx q[0], q[8];
x q[8];
z q[4];
cx q[1], q[7];
