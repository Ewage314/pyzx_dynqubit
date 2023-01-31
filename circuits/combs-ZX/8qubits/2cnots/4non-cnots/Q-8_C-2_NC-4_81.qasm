OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[4];
cx q[4], q[0];
z q[6];
x q[5];
x q[1];
cx q[6], q[5];
