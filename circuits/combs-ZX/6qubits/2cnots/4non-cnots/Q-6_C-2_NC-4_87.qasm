OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
x q[3];
x q[0];
z q[5];
cx q[4], q[0];
z q[4];
cx q[5], q[1];
