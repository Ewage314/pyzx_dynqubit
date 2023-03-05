OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[8];
z q[10];
cx q[6], q[5];
x q[10];
cx q[7], q[15];
cx q[13], q[19];
