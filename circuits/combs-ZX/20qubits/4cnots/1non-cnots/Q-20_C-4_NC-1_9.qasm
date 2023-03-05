OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[8];
cx q[14], q[13];
z q[17];
cx q[9], q[16];
cx q[1], q[16];
