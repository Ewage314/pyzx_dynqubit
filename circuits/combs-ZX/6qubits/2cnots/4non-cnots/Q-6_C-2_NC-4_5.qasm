OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
z q[3];
z q[2];
x q[3];
cx q[1], q[0];
z q[0];
cx q[5], q[2];
