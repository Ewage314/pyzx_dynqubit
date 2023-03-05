OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[11];
x q[0];
cx q[2], q[4];
cx q[8], q[4];
cx q[9], q[2];
