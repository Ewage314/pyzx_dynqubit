OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
x q[0];
cx q[1], q[2];
z q[3];
cx q[0], q[4];
