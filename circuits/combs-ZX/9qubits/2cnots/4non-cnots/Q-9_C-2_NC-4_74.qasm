OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[8];
x q[3];
z q[4];
z q[7];
cx q[3], q[7];
cx q[1], q[8];
