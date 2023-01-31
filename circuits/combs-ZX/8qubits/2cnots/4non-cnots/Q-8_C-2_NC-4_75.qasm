OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[7];
cx q[2], q[7];
x q[5];
x q[7];
z q[7];
cx q[3], q[5];
