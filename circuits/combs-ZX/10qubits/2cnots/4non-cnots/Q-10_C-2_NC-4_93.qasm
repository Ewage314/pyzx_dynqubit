OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[3];
z q[5];
x q[3];
cx q[1], q[5];
z q[0];
cx q[1], q[2];
