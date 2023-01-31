OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[3];
x q[1];
x q[6];
z q[0];
cx q[2], q[9];
cx q[5], q[6];
