OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[1];
cx q[3], q[9];
x q[9];
z q[1];
z q[7];
cx q[4], q[7];
