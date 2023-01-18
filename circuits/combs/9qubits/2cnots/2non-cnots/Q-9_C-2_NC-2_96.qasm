OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[3];
cx q[5], q[4];
x q[4];
cx q[2], q[3];
