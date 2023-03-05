OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[0];
cx q[0], q[14];
cx q[9], q[5];
z q[9];
cx q[12], q[9];
cx q[16], q[10];
