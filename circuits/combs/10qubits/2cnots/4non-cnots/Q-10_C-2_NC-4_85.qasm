OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[0], q[1];
x q[1];
x q[8];
x q[1];
x q[9];
cx q[7], q[2];
