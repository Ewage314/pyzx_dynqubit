OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[16];
cx q[2], q[7];
cx q[16], q[3];
z q[9];
cx q[14], q[16];
