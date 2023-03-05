OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[11];
cx q[13], q[10];
x q[9];
cx q[6], q[10];
cx q[5], q[10];
