OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[5];
cx q[2], q[9];
cx q[6], q[1];
cx q[1], q[5];
cx q[9], q[6];
