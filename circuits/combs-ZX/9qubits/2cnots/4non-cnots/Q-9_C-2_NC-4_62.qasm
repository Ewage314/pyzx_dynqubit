OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[3];
x q[2];
x q[8];
z q[0];
cx q[7], q[2];
cx q[6], q[3];
