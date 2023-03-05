OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[16];
cx q[12], q[4];
cx q[19], q[5];
x q[2];
x q[5];
cx q[14], q[2];
