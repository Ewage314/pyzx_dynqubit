OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
x q[3];
z q[4];
cx q[4], q[3];
x q[5];
z q[4];
cx q[2], q[5];
