OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[3];
z q[4];
cx q[3], q[2];
cx q[2], q[5];
