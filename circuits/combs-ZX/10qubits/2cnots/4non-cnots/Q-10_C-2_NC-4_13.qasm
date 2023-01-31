OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[1];
z q[8];
x q[9];
cx q[8], q[3];
z q[0];
cx q[8], q[0];
