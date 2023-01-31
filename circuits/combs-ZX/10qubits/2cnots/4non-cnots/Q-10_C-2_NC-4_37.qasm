OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[8];
z q[7];
cx q[0], q[7];
x q[2];
x q[9];
cx q[6], q[2];
