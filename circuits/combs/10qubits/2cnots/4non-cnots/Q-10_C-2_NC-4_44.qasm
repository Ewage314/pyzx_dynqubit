OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[0];
cx q[1], q[9];
x q[8];
x q[9];
x q[0];
cx q[2], q[1];
