OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[3];
x q[9];
cx q[5], q[4];
cx q[2], q[1];
