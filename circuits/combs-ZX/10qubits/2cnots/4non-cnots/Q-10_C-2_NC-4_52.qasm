OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[3];
cx q[3], q[9];
z q[7];
x q[9];
z q[3];
cx q[2], q[0];
