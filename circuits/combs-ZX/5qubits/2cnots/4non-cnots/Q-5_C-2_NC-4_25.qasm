OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
z q[4];
z q[4];
x q[2];
x q[0];
cx q[4], q[0];
cx q[4], q[0];
