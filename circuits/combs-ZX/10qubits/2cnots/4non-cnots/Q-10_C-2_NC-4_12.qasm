OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[8];
cx q[7], q[6];
x q[2];
z q[7];
z q[6];
cx q[0], q[5];
