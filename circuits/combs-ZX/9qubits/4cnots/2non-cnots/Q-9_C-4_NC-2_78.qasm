OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[6];
cx q[1], q[3];
cx q[0], q[6];
cx q[7], q[4];
z q[1];
cx q[2], q[6];
