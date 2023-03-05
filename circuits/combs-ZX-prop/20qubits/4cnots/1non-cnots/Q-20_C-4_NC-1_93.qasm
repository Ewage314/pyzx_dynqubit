OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[16];
z q[9];
cx q[15], q[13];
cx q[16], q[3];
cx q[14], q[16];
