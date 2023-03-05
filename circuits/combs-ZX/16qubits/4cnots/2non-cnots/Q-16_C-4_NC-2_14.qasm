OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[2];
z q[6];
cx q[5], q[12];
cx q[13], q[2];
z q[7];
cx q[12], q[14];
