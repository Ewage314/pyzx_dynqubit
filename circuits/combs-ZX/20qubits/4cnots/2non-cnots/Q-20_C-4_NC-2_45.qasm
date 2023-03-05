OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[5];
cx q[17], q[10];
cx q[7], q[12];
x q[11];
z q[14];
cx q[7], q[14];
