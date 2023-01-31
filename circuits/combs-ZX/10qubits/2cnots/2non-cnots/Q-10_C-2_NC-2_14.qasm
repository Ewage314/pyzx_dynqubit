OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[3];
z q[8];
cx q[6], q[2];
cx q[6], q[9];
