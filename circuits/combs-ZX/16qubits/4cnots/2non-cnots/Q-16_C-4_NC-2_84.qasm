OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[14];
cx q[3], q[8];
cx q[0], q[10];
cx q[12], q[5];
x q[10];
cx q[2], q[10];
