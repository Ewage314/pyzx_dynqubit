OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[3];
cx q[7], q[0];
x q[3];
z q[6];
z q[2];
cx q[4], q[8];
