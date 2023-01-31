OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[2];
z q[9];
x q[6];
cx q[5], q[0];
z q[8];
cx q[2], q[3];
