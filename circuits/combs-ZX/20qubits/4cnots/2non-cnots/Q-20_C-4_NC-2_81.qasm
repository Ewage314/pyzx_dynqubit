OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[15];
cx q[0], q[12];
cx q[0], q[13];
x q[16];
cx q[19], q[8];
cx q[7], q[12];
