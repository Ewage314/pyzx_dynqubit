OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[3];
cx q[7], q[5];
x q[2];
z q[8];
x q[9];
cx q[2], q[4];
