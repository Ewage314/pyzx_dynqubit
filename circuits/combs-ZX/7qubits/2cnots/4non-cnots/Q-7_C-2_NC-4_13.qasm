OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
z q[4];
x q[3];
z q[1];
cx q[1], q[5];
x q[5];
cx q[0], q[5];
