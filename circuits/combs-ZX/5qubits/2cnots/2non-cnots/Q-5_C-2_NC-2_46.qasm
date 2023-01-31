OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
z q[4];
x q[2];
cx q[1], q[4];
cx q[3], q[2];
