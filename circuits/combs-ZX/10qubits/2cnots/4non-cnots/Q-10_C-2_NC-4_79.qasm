OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[2];
z q[8];
z q[1];
z q[8];
x q[3];
cx q[6], q[4];
