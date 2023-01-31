OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
cx q[2], q[0];
cx q[0], q[2];
z q[1];
cx q[0], q[3];
x q[1];
cx q[0], q[1];
