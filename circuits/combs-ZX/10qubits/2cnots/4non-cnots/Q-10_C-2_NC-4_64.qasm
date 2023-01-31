OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[9];
x q[5];
z q[7];
cx q[4], q[2];
x q[5];
cx q[8], q[2];
