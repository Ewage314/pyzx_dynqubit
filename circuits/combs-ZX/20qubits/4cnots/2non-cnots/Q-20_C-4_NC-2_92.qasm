OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[14];
x q[2];
z q[1];
cx q[12], q[15];
cx q[9], q[1];
cx q[7], q[16];
