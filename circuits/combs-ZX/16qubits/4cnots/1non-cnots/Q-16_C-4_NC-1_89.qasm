OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[10];
x q[15];
cx q[10], q[9];
cx q[12], q[0];
cx q[4], q[11];
