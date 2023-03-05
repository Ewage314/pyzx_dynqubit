OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[5];
x q[10];
cx q[2], q[11];
cx q[0], q[6];
cx q[12], q[2];
cx q[8], q[2];
