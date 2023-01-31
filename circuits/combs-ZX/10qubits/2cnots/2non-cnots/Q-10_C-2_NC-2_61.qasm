OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[2];
x q[2];
z q[1];
cx q[0], q[1];
