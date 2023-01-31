OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[9];
x q[5];
x q[9];
cx q[3], q[2];
x q[1];
cx q[4], q[3];
