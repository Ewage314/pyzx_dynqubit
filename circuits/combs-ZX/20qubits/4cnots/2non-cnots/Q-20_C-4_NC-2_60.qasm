OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[1];
x q[10];
cx q[10], q[18];
cx q[7], q[5];
z q[3];
cx q[17], q[6];
