OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
x q[1];
x q[1];
x q[2];
cx q[4], q[1];
x q[0];
cx q[2], q[5];
