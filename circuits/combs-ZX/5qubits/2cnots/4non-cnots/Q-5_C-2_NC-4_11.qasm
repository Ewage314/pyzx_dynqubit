OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
z q[3];
x q[3];
z q[4];
x q[1];
cx q[2], q[4];
cx q[2], q[0];
