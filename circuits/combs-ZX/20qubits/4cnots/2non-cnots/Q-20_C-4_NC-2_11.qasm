OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[9];
x q[8];
cx q[2], q[14];
cx q[5], q[15];
cx q[15], q[10];
cx q[16], q[1];
