OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[5];
cx q[1], q[4];
z q[5];
cx q[1], q[8];
