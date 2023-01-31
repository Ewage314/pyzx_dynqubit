OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[5], q[7];
x q[9];
x q[3];
x q[2];
z q[7];
cx q[6], q[9];
