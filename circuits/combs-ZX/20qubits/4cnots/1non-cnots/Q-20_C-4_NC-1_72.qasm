OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[15];
cx q[2], q[8];
cx q[5], q[0];
x q[19];
cx q[5], q[0];
