OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[5], q[7];
z q[9];
x q[0];
x q[3];
z q[9];
cx q[2], q[4];
