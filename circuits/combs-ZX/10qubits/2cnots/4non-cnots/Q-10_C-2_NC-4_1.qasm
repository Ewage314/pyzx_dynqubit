OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[9];
z q[4];
x q[0];
cx q[1], q[2];
z q[3];
cx q[5], q[7];
