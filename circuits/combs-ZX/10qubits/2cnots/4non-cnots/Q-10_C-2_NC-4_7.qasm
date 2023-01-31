OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[3];
z q[3];
cx q[5], q[7];
x q[4];
z q[3];
cx q[0], q[3];
