OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[3];
x q[2];
x q[0];
cx q[0], q[5];
z q[4];
cx q[1], q[4];
