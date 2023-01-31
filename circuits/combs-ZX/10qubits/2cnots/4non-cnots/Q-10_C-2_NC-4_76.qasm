OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[5], q[1];
z q[8];
x q[3];
x q[5];
x q[8];
cx q[8], q[1];
