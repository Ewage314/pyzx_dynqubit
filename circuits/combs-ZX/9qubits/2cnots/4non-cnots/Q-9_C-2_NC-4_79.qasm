OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[2];
x q[4];
x q[0];
z q[0];
z q[6];
cx q[2], q[8];
