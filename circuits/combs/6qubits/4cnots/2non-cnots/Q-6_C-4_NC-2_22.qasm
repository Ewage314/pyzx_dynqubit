OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
x q[5];
x q[3];
cx q[5], q[4];
cx q[4], q[5];
cx q[2], q[5];
cx q[2], q[3];
