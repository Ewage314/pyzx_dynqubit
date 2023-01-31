OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[2];
x q[3];
cx q[4], q[5];
x q[2];
z q[1];
cx q[1], q[2];
