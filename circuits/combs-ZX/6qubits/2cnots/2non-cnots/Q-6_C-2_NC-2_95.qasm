OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
z q[2];
x q[4];
cx q[0], q[1];
cx q[4], q[2];
