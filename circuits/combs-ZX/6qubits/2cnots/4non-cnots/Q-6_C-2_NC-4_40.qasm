OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
z q[1];
cx q[0], q[4];
z q[2];
x q[5];
x q[1];
cx q[5], q[0];
