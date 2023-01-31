OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[2];
z q[7];
x q[5];
x q[5];
cx q[3], q[4];
cx q[5], q[6];
