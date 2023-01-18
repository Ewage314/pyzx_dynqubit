OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[1];
cx q[2], q[4];
x q[5];
x q[9];
x q[4];
cx q[2], q[3];
