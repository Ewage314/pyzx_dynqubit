OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[8];
z q[7];
cx q[6], q[9];
x q[9];
x q[1];
cx q[2], q[5];
