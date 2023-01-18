OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[3];
x q[9];
x q[6];
cx q[1], q[6];
x q[0];
cx q[6], q[5];
