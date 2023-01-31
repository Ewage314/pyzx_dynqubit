OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
x q[3];
z q[2];
z q[1];
x q[4];
cx q[5], q[3];
cx q[0], q[3];
