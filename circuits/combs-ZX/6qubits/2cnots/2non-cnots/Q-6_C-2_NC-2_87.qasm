OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
x q[1];
cx q[2], q[1];
z q[5];
cx q[3], q[5];
