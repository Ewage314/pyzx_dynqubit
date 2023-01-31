OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[7];
x q[0];
cx q[4], q[0];
x q[5];
z q[3];
cx q[0], q[4];
