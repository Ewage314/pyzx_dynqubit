OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[0];
cx q[5], q[2];
z q[2];
z q[0];
x q[3];
cx q[4], q[1];
