OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[19];
z q[0];
x q[16];
cx q[16], q[4];
cx q[5], q[15];
cx q[3], q[14];
