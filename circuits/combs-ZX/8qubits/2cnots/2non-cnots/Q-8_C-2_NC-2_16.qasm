OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[6], q[5];
z q[2];
x q[4];
cx q[2], q[0];
