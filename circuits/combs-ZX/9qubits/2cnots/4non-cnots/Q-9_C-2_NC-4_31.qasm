OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[3];
z q[4];
x q[2];
z q[8];
cx q[6], q[2];
cx q[1], q[7];
