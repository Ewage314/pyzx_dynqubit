OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[5];
cx q[0], q[2];
z q[3];
cx q[8], q[2];
