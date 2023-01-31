OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[4];
cx q[1], q[2];
z q[1];
cx q[4], q[3];
