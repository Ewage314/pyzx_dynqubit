OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[4];
cx q[3], q[2];
x q[8];
x q[9];
z q[4];
cx q[9], q[3];
