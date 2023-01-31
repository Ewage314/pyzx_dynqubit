OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[6];
x q[8];
cx q[1], q[4];
cx q[3], q[2];
