OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[6], q[9];
x q[0];
cx q[0], q[3];
cx q[6], q[5];
z q[0];
cx q[4], q[5];
