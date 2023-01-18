OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[0], q[5];
cx q[2], q[7];
x q[2];
x q[0];
cx q[6], q[5];
cx q[0], q[2];
