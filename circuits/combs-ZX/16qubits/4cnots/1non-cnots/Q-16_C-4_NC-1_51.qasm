OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[4];
cx q[5], q[14];
cx q[2], q[0];
z q[10];
cx q[13], q[5];
