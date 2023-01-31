OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[2];
z q[0];
x q[6];
x q[0];
cx q[8], q[4];
cx q[0], q[4];
