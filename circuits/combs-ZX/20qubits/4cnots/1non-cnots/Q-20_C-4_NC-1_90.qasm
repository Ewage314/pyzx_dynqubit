OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[0], q[11];
cx q[5], q[16];
cx q[19], q[0];
x q[0];
cx q[14], q[19];
