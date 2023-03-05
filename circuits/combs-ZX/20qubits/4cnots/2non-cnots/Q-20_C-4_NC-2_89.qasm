OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[7];
cx q[13], q[16];
x q[13];
cx q[2], q[7];
cx q[12], q[15];
cx q[4], q[3];
