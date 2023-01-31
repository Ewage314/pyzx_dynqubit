OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[2], q[4];
x q[5];
z q[4];
x q[6];
x q[4];
cx q[5], q[0];
