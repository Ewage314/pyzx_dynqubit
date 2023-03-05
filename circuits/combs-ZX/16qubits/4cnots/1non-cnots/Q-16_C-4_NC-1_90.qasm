OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[14];
cx q[4], q[14];
cx q[2], q[3];
z q[1];
cx q[14], q[2];
