OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
x q[4];
z q[4];
cx q[0], q[3];
x q[3];
z q[4];
cx q[1], q[2];
