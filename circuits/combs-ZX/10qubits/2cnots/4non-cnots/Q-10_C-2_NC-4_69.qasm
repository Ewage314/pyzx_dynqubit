OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[7];
x q[9];
x q[2];
z q[0];
cx q[1], q[3];
cx q[4], q[6];
