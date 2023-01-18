OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[1], q[9];
x q[8];
x q[0];
x q[4];
x q[1];
cx q[5], q[2];
