OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[6];
z q[5];
cx q[1], q[5];
z q[7];
z q[4];
cx q[5], q[7];
