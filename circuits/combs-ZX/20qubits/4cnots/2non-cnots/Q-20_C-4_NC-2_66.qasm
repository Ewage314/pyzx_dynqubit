OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[13];
x q[17];
cx q[18], q[2];
x q[10];
cx q[0], q[19];
cx q[1], q[5];
