OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[5];
x q[8];
cx q[8], q[1];
x q[2];
x q[2];
cx q[8], q[6];
