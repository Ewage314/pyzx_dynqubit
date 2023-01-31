OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[0];
cx q[2], q[5];
x q[1];
cx q[0], q[1];
