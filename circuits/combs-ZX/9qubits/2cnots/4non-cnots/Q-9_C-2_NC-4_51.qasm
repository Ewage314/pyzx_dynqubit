OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[1];
z q[2];
z q[2];
cx q[1], q[4];
x q[3];
cx q[5], q[6];
