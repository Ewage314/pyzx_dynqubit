OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[0], q[9];
x q[2];
x q[9];
x q[5];
x q[9];
cx q[6], q[7];
