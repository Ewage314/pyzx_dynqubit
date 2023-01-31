OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[3];
cx q[6], q[5];
z q[3];
cx q[4], q[9];
