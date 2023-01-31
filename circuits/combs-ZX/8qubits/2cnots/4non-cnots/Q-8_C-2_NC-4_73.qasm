OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[5];
x q[6];
x q[2];
cx q[6], q[3];
z q[1];
cx q[4], q[5];
