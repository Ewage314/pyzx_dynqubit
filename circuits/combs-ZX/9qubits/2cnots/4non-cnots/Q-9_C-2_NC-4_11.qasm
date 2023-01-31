OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[3];
x q[6];
cx q[5], q[1];
z q[4];
z q[0];
cx q[2], q[1];
