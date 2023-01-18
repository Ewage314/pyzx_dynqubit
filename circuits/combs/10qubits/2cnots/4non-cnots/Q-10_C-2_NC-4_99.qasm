OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[4], q[2];
x q[9];
x q[9];
x q[6];
x q[5];
cx q[9], q[6];
