OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
cx q[5], q[2];
z q[3];
z q[0];
z q[4];
x q[0];
cx q[0], q[5];
