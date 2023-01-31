OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
z q[0];
x q[2];
x q[3];
z q[4];
cx q[1], q[0];
cx q[4], q[0];
