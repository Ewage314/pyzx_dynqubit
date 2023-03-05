OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[12];
cx q[5], q[14];
cx q[15], q[12];
z q[5];
cx q[6], q[5];
