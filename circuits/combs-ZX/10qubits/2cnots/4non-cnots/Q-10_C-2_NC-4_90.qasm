OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[5], q[2];
z q[3];
x q[3];
x q[1];
z q[5];
cx q[9], q[1];
