OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[5];
z q[9];
cx q[3], q[8];
z q[1];
z q[2];
cx q[8], q[0];
