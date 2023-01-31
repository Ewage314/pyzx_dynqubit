OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[3];
cx q[0], q[4];
x q[4];
cx q[1], q[2];
