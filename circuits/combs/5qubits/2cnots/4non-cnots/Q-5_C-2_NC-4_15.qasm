OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
cx q[2], q[1];
x q[1];
x q[4];
x q[0];
x q[4];
cx q[1], q[2];
