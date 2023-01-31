OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
z q[4];
cx q[0], q[2];
x q[0];
z q[5];
z q[5];
cx q[5], q[1];
