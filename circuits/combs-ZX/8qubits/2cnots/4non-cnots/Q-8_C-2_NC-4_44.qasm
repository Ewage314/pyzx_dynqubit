OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[7];
x q[2];
x q[7];
x q[7];
cx q[0], q[6];
cx q[2], q[5];
