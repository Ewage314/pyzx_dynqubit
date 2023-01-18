OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[3];
cx q[4], q[7];
x q[9];
cx q[2], q[5];
