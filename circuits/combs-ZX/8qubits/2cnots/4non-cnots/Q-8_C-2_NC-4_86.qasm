OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[1];
cx q[2], q[4];
z q[3];
x q[5];
x q[3];
cx q[4], q[1];
