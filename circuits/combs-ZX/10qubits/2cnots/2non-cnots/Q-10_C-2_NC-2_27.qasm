OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[1];
cx q[2], q[5];
z q[9];
cx q[8], q[3];
