OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
z q[0];
z q[5];
z q[3];
cx q[3], q[5];
x q[3];
cx q[0], q[2];
