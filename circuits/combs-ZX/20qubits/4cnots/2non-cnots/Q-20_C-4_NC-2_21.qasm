OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[1];
x q[3];
cx q[19], q[9];
z q[17];
cx q[0], q[16];
cx q[3], q[12];
