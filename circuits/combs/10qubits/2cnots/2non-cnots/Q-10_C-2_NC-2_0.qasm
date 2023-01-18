OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[8];
x q[9];
cx q[8], q[1];
cx q[8], q[4];
