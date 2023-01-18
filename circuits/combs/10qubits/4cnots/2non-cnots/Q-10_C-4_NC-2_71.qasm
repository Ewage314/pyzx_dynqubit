OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[5], q[2];
cx q[5], q[2];
x q[8];
cx q[5], q[2];
x q[0];
cx q[1], q[4];
