OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[6];
z q[4];
x q[2];
x q[3];
cx q[3], q[0];
cx q[6], q[2];
