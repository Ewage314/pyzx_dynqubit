OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[6], q[4];
x q[2];
x q[9];
cx q[5], q[9];
