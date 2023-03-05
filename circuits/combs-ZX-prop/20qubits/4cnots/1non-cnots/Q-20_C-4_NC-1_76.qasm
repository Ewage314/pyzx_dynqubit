OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[13];
cx q[5], q[9];
cx q[2], q[16];
x q[13];
cx q[12], q[13];
