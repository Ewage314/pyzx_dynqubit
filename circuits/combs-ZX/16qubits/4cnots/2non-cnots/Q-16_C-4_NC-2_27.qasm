OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[3];
z q[12];
cx q[2], q[15];
cx q[13], q[1];
x q[10];
cx q[8], q[14];
