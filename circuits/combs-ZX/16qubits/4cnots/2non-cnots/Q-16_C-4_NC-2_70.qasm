OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[7];
cx q[5], q[1];
cx q[4], q[11];
x q[5];
x q[7];
cx q[1], q[8];
