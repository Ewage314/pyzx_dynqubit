OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
x q[0];
cx q[2], q[0];
x q[5];
z q[2];
x q[0];
cx q[0], q[1];
