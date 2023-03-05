OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[8];
cx q[16], q[18];
cx q[9], q[17];
cx q[8], q[16];
cx q[2], q[16];
