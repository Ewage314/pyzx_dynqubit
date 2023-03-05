OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[6];
z q[14];
cx q[15], q[5];
cx q[13], q[14];
z q[10];
cx q[5], q[3];
