OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[7], q[9];
z q[12];
cx q[5], q[6];
cx q[10], q[14];
