OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
x q[5];
z q[5];
cx q[0], q[4];
z q[0];
x q[5];
cx q[1], q[3];
