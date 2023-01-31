OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[6];
z q[8];
x q[5];
cx q[0], q[1];
z q[9];
cx q[2], q[6];
