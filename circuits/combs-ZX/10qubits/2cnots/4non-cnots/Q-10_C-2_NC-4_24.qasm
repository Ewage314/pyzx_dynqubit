OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[3];
x q[7];
z q[6];
cx q[8], q[0];
x q[8];
cx q[1], q[4];
