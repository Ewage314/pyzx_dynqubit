OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[9];
cx q[2], q[6];
z q[12];
cx q[1], q[6];
cx q[12], q[1];
