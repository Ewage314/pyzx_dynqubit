OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[6];
x q[4];
cx q[4], q[7];
z q[6];
z q[5];
cx q[0], q[6];
