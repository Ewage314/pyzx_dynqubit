OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[3];
z q[1];
z q[2];
x q[8];
cx q[4], q[1];
cx q[2], q[0];
