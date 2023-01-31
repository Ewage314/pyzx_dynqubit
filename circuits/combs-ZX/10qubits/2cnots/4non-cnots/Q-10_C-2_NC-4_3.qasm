OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[9], q[7];
z q[2];
z q[2];
x q[5];
z q[5];
cx q[4], q[9];
