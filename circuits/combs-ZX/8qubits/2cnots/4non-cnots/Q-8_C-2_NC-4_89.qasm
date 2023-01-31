OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[0];
cx q[0], q[2];
x q[6];
z q[2];
x q[3];
cx q[0], q[5];
