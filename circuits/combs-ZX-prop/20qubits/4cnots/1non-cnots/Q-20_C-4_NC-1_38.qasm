OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[2];
z q[2];
cx q[16], q[19];
cx q[8], q[16];
cx q[17], q[10];
