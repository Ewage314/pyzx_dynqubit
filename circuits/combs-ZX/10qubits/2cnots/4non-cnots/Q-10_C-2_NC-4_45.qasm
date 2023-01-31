OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[5], q[0];
x q[8];
z q[8];
z q[1];
z q[5];
cx q[1], q[3];
