OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[6];
cx q[1], q[7];
z q[1];
x q[2];
z q[8];
cx q[0], q[2];
