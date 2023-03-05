OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[3];
z q[4];
x q[18];
cx q[13], q[5];
cx q[17], q[16];
cx q[1], q[15];
