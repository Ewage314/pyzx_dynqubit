OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[11];
z q[10];
cx q[3], q[13];
cx q[8], q[9];
x q[1];
cx q[5], q[6];
