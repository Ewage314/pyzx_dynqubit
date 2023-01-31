OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
x q[2];
x q[3];
z q[4];
z q[3];
cx q[1], q[3];
cx q[0], q[3];
