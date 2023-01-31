OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[0];
z q[4];
z q[1];
cx q[7], q[2];
x q[1];
cx q[0], q[1];
