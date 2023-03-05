OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[14];
cx q[3], q[0];
cx q[1], q[0];
cx q[2], q[3];
cx q[10], q[2];
