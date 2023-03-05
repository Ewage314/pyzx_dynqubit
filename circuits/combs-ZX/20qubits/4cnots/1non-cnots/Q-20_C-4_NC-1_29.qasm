OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[18];
x q[15];
cx q[7], q[0];
cx q[18], q[3];
cx q[17], q[10];
