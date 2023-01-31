OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[8];
x q[8];
cx q[8], q[0];
cx q[5], q[2];
