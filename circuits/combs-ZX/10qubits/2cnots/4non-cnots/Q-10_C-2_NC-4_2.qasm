OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[8];
z q[7];
z q[7];
z q[5];
cx q[7], q[9];
cx q[1], q[6];
