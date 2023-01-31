OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[9];
cx q[6], q[2];
z q[5];
cx q[6], q[7];
