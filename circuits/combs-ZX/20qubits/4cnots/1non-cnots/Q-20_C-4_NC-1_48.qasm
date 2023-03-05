OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[15], q[3];
x q[16];
cx q[2], q[17];
cx q[5], q[12];
cx q[0], q[2];
