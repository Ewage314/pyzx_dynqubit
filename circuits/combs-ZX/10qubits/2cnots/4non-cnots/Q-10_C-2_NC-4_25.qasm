OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[1];
z q[9];
cx q[8], q[3];
x q[8];
z q[3];
cx q[7], q[8];
