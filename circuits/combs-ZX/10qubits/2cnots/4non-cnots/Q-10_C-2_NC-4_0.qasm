OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[7];
z q[7];
cx q[4], q[3];
x q[1];
x q[8];
cx q[1], q[6];
