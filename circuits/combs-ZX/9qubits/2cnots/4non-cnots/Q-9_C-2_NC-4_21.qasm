OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[1];
z q[4];
z q[7];
x q[2];
cx q[7], q[8];
cx q[2], q[8];
