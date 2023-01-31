OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[7];
cx q[3], q[5];
x q[4];
z q[4];
z q[7];
cx q[1], q[2];
