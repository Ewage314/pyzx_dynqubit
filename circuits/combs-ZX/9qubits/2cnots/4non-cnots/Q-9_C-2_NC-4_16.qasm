OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[6];
x q[6];
x q[6];
x q[2];
cx q[5], q[2];
cx q[1], q[0];
