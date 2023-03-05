OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[5], q[15];
x q[9];
cx q[2], q[14];
cx q[1], q[15];
