OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[7];
x q[6];
cx q[5], q[9];
z q[16];
cx q[4], q[15];
cx q[11], q[12];
