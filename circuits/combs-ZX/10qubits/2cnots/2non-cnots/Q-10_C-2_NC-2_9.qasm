OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[4];
x q[8];
cx q[2], q[8];
cx q[1], q[2];
