OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[0], q[5];
z q[4];
x q[1];
cx q[6], q[9];
