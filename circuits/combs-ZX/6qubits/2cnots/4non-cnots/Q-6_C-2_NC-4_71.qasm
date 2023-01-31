OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
x q[5];
z q[2];
x q[0];
cx q[4], q[1];
z q[0];
cx q[0], q[4];
