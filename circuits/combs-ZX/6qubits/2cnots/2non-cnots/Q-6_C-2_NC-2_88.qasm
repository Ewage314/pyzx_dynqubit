OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
x q[2];
z q[1];
cx q[1], q[5];
cx q[5], q[3];
