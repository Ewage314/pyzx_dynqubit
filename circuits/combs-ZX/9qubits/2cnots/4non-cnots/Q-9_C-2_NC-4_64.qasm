OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[2];
x q[5];
x q[7];
x q[4];
z q[2];
cx q[0], q[8];
