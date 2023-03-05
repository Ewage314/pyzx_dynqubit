OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[18];
cx q[2], q[15];
cx q[3], q[16];
cx q[4], q[18];
x q[5];
cx q[7], q[10];
