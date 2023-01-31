OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[2], q[9];
x q[6];
z q[9];
z q[2];
z q[5];
cx q[4], q[6];
