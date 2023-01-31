OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
x q[0];
cx q[2], q[4];
x q[0];
z q[4];
x q[0];
cx q[0], q[6];
