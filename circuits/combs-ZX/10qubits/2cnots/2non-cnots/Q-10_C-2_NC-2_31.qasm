OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[6];
z q[8];
cx q[5], q[9];
cx q[8], q[1];
