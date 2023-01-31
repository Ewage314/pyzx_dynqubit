OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[8];
z q[9];
x q[4];
cx q[1], q[2];
z q[2];
cx q[4], q[5];
