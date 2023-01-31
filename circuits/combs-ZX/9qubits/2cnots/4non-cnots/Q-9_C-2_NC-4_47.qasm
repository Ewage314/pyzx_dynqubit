OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[0];
cx q[0], q[2];
z q[5];
z q[6];
x q[2];
cx q[6], q[1];
