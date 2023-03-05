OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[5];
x q[15];
cx q[3], q[17];
cx q[9], q[19];
cx q[1], q[10];
