OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[8];
z q[5];
z q[2];
cx q[5], q[3];
z q[4];
cx q[4], q[8];
