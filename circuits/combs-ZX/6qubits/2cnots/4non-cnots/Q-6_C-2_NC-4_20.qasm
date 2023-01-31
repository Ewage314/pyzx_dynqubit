OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
z q[4];
z q[4];
x q[1];
cx q[0], q[1];
z q[5];
cx q[4], q[1];
