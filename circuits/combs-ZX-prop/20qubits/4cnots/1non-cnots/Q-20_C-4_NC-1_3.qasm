OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[18];
x q[9];
cx q[14], q[16];
cx q[2], q[6];
cx q[1], q[15];
