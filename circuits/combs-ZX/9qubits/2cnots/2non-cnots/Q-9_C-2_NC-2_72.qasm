OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[5];
cx q[8], q[1];
x q[5];
cx q[0], q[4];
