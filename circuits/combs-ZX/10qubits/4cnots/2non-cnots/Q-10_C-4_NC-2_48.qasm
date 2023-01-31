OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[9];
cx q[2], q[9];
x q[4];
cx q[1], q[5];
x q[8];
cx q[8], q[4];
