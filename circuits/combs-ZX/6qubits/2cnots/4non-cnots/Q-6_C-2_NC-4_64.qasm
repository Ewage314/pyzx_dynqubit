OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
z q[3];
z q[5];
z q[4];
x q[5];
cx q[0], q[3];
cx q[0], q[3];
