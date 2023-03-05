OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[18], q[16];
x q[6];
cx q[2], q[9];
cx q[1], q[6];
cx q[5], q[16];
