OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
z q[3];
cx q[2], q[3];
x q[4];
x q[2];
z q[0];
cx q[5], q[1];
