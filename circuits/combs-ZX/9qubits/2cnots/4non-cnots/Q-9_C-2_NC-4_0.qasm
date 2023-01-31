OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[2];
z q[4];
x q[8];
cx q[1], q[8];
z q[5];
cx q[5], q[7];
