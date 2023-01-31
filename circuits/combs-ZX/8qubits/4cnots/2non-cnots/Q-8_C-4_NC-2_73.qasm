OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[2], q[7];
cx q[0], q[7];
z q[7];
x q[7];
cx q[1], q[5];
cx q[0], q[2];
