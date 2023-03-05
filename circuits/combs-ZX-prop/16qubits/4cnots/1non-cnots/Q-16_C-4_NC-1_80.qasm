OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[12];
cx q[12], q[15];
x q[9];
cx q[2], q[5];
cx q[14], q[0];
