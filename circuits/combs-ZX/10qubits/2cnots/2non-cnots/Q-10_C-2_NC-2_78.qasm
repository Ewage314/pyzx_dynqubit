OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[2];
z q[5];
x q[1];
cx q[4], q[5];
