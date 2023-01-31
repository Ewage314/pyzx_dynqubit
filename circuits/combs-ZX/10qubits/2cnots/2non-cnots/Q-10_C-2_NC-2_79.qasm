OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[3], q[6];
x q[5];
z q[7];
cx q[0], q[9];
