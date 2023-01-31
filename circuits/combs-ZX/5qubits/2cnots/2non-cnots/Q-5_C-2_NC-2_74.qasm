OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
cx q[4], q[0];
z q[4];
x q[2];
cx q[0], q[4];
