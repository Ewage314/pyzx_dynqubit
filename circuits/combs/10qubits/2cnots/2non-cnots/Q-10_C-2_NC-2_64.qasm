OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[4], q[9];
x q[0];
x q[2];
cx q[1], q[0];
