OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[16];
cx q[15], q[4];
cx q[10], q[11];
cx q[15], q[5];
z q[6];
cx q[17], q[14];
