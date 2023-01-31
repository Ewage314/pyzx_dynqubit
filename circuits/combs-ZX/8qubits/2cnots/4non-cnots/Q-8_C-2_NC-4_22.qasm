OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[5];
x q[7];
x q[7];
cx q[3], q[4];
z q[4];
cx q[2], q[3];
