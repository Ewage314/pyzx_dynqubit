OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[4];
x q[17];
cx q[10], q[8];
cx q[15], q[11];
z q[10];
cx q[0], q[11];
