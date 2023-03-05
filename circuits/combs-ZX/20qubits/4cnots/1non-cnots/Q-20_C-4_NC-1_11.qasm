OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[17];
x q[11];
cx q[19], q[10];
cx q[2], q[19];
cx q[15], q[10];
