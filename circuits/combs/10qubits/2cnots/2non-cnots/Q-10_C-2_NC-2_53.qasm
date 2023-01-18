OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[8];
x q[9];
cx q[2], q[6];
cx q[7], q[6];
