OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[1];
cx q[1], q[2];
cx q[6], q[11];
x q[2];
cx q[7], q[6];
cx q[7], q[10];
