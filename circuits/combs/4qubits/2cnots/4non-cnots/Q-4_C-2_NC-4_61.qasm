OPENQASM 2.0;
include "qelib1.inc";
qreg q[4];
x q[2];
x q[1];
cx q[1], q[3];
x q[1];
x q[0];
cx q[1], q[2];
