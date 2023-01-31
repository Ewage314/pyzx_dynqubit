OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[6];
z q[4];
x q[8];
cx q[1], q[5];
z q[3];
cx q[6], q[4];
