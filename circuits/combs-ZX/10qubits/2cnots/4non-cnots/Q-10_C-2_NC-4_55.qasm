OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[5];
z q[8];
cx q[7], q[8];
x q[4];
z q[3];
cx q[7], q[1];
