OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[0];
cx q[6], q[15];
cx q[0], q[16];
cx q[17], q[10];
cx q[16], q[19];
