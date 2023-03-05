OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[10];
cx q[9], q[8];
cx q[2], q[4];
z q[14];
cx q[0], q[14];
