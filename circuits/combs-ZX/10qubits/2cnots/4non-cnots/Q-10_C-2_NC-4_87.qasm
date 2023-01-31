OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[7];
cx q[1], q[3];
x q[1];
z q[5];
x q[3];
cx q[7], q[8];
