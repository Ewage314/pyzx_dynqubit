OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[14];
cx q[10], q[9];
cx q[12], q[4];
z q[1];
cx q[5], q[14];
