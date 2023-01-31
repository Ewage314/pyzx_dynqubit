OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[9];
cx q[0], q[1];
cx q[9], q[1];
z q[4];
cx q[9], q[5];
cx q[8], q[4];
