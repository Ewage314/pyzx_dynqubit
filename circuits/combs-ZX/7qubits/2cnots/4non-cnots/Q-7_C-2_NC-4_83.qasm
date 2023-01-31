OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
z q[4];
x q[4];
cx q[2], q[0];
x q[2];
z q[6];
cx q[6], q[3];
