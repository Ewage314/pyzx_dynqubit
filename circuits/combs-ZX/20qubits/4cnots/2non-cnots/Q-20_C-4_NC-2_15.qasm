OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[0];
x q[18];
cx q[9], q[17];
cx q[5], q[16];
cx q[1], q[15];
cx q[16], q[11];
