OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[0];
x q[2];
z q[2];
z q[0];
cx q[6], q[5];
cx q[7], q[4];
