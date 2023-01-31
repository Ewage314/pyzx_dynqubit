OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[3];
z q[4];
z q[0];
cx q[4], q[7];
x q[8];
cx q[0], q[8];
