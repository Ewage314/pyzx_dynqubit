OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[7];
cx q[8], q[4];
x q[8];
x q[5];
z q[7];
cx q[4], q[5];
