OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
x q[0];
z q[4];
cx q[4], q[5];
x q[6];
z q[0];
cx q[2], q[3];
