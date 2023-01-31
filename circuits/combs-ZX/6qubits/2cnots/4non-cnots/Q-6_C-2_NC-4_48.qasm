OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
z q[1];
x q[0];
cx q[5], q[1];
x q[5];
z q[2];
cx q[0], q[3];
