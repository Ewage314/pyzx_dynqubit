OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[10];
cx q[14], q[6];
cx q[13], q[0];
z q[14];
cx q[8], q[5];
