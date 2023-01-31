OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[8];
cx q[5], q[2];
x q[1];
z q[6];
z q[3];
cx q[4], q[0];
