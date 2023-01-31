OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[7];
cx q[4], q[5];
z q[1];
z q[5];
x q[8];
cx q[2], q[6];
