OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[2];
z q[5];
x q[7];
cx q[1], q[6];
x q[6];
cx q[1], q[9];
