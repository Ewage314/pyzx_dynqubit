OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[16];
x q[11];
z q[5];
cx q[9], q[13];
cx q[17], q[6];
cx q[6], q[0];
