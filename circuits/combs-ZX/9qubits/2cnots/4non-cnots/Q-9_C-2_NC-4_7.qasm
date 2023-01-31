OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[5];
z q[0];
cx q[2], q[5];
x q[2];
z q[6];
cx q[0], q[8];
