OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[8];
cx q[1], q[5];
cx q[5], q[3];
cx q[6], q[10];
cx q[10], q[5];
