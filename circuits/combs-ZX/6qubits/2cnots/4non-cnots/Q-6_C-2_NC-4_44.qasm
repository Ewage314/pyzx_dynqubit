OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
z q[1];
cx q[5], q[3];
z q[2];
x q[1];
x q[1];
cx q[2], q[5];
