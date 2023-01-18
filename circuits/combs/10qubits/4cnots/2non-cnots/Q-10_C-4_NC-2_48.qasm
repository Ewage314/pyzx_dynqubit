OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[8];
cx q[4], q[5];
cx q[6], q[2];
cx q[5], q[9];
x q[8];
cx q[5], q[4];
