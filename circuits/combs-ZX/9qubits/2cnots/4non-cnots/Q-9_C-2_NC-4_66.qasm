OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[1];
x q[2];
x q[0];
cx q[4], q[8];
x q[2];
cx q[8], q[4];
