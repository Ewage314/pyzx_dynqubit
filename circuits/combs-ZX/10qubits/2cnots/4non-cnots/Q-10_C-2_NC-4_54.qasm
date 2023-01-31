OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[3];
x q[6];
z q[3];
x q[3];
cx q[8], q[3];
cx q[1], q[2];
