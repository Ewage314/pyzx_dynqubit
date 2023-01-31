OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
z q[8];
x q[0];
z q[4];
x q[1];
cx q[4], q[3];
