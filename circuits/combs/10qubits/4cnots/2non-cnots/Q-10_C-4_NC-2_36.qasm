OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[3], q[8];
x q[5];
x q[8];
cx q[5], q[6];
cx q[4], q[8];
cx q[6], q[4];
