OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[9];
cx q[9], q[2];
z q[6];
cx q[5], q[6];
cx q[1], q[3];
cx q[5], q[9];
