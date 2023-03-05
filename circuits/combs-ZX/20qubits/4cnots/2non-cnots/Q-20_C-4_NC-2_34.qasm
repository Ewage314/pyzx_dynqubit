OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[5];
cx q[2], q[0];
x q[19];
cx q[4], q[14];
z q[5];
cx q[5], q[19];
