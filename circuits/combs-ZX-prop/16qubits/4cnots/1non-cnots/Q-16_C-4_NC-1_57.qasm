OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[15];
cx q[9], q[11];
x q[11];
cx q[6], q[10];
cx q[0], q[5];
