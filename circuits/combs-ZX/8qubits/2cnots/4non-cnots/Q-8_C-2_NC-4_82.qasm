OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[2];
z q[4];
z q[2];
z q[3];
cx q[5], q[0];
cx q[6], q[3];
