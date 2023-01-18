OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[6];
x q[2];
x q[8];
cx q[8], q[2];
x q[5];
cx q[9], q[2];
