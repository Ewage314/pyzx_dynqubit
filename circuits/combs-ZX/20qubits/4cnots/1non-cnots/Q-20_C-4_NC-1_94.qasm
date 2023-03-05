OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[14];
cx q[15], q[10];
z q[16];
cx q[5], q[16];
cx q[5], q[2];
