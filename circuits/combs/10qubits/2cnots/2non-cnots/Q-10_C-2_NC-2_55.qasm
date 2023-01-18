OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[6];
cx q[1], q[8];
x q[8];
cx q[4], q[2];
