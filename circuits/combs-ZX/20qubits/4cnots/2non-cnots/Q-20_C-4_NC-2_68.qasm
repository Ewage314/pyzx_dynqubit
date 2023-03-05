OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[0];
x q[6];
cx q[5], q[9];
z q[5];
cx q[1], q[18];
cx q[0], q[9];
