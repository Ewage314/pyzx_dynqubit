OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[7];
x q[8];
z q[8];
x q[7];
cx q[7], q[8];
cx q[4], q[9];
