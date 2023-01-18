OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[4], q[8];
cx q[2], q[3];
cx q[0], q[5];
x q[3];
cx q[8], q[9];
