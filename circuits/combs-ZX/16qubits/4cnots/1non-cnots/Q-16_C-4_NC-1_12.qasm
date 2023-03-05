OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[9];
cx q[2], q[10];
cx q[6], q[9];
x q[15];
cx q[6], q[12];
