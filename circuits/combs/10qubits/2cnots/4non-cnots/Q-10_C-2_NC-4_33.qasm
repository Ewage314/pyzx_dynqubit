OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[6];
x q[2];
x q[1];
cx q[2], q[3];
x q[2];
cx q[1], q[5];
