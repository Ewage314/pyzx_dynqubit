OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[4];
z q[15];
cx q[9], q[12];
cx q[7], q[9];
cx q[4], q[16];
