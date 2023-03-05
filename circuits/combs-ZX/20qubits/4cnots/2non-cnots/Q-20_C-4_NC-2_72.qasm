OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[6];
x q[11];
cx q[3], q[8];
cx q[11], q[9];
cx q[8], q[12];
cx q[12], q[6];
