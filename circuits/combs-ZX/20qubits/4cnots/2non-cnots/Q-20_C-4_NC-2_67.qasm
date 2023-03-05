OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[4];
cx q[7], q[10];
cx q[0], q[12];
cx q[17], q[9];
x q[8];
cx q[12], q[11];
