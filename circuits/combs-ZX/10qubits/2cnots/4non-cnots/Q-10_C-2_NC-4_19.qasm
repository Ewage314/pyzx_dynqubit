OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[9];
cx q[1], q[2];
z q[1];
x q[3];
z q[7];
cx q[4], q[8];
