OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[3];
z q[0];
cx q[0], q[8];
cx q[4], q[2];
