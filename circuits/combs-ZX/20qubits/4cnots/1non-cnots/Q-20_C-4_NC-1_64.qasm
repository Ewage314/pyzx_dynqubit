OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[8];
cx q[13], q[8];
z q[16];
cx q[10], q[6];
cx q[9], q[14];
