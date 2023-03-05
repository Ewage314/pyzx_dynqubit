OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[6];
x q[10];
cx q[19], q[10];
cx q[4], q[19];
z q[12];
cx q[14], q[2];
