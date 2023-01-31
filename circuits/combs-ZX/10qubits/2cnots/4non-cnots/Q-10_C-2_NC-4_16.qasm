OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[9];
x q[6];
x q[5];
z q[8];
cx q[7], q[3];
cx q[3], q[5];
