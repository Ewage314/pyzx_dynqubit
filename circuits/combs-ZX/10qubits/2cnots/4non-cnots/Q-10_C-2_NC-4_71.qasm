OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[2];
z q[9];
cx q[6], q[4];
x q[8];
z q[7];
cx q[0], q[5];
