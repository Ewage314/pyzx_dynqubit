OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[14];
x q[10];
cx q[9], q[15];
x q[14];
cx q[4], q[10];
cx q[0], q[4];
