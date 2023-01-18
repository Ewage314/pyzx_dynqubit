OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[2], q[1];
x q[3];
x q[5];
cx q[9], q[2];
