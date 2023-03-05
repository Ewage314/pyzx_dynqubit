OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[12];
cx q[6], q[2];
x q[12];
cx q[1], q[16];
cx q[9], q[15];
cx q[2], q[3];
