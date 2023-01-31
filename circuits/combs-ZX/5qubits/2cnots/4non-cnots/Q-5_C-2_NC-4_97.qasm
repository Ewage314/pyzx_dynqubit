OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
x q[3];
cx q[1], q[2];
z q[0];
z q[1];
x q[1];
cx q[2], q[4];
