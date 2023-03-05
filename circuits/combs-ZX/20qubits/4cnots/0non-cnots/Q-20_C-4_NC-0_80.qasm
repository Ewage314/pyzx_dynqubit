OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[0];
cx q[10], q[16];
cx q[17], q[14];
cx q[1], q[2];
