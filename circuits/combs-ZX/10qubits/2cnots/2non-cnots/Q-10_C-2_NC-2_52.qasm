OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[6];
cx q[0], q[1];
z q[6];
cx q[4], q[1];
