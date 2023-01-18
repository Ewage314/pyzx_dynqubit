OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[4];
x q[8];
x q[5];
cx q[2], q[4];
x q[9];
cx q[6], q[4];
