OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[7];
cx q[13], q[16];
cx q[16], q[12];
cx q[0], q[1];
cx q[4], q[1];
