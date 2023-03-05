OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[0], q[16];
cx q[2], q[17];
x q[12];
cx q[3], q[5];
z q[8];
cx q[13], q[0];
