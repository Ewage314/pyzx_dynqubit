OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[0];
cx q[0], q[5];
z q[5];
cx q[6], q[0];
