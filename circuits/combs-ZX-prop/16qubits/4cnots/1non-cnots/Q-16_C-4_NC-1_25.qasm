OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[15];
cx q[13], q[6];
cx q[9], q[6];
cx q[12], q[4];
cx q[5], q[14];
