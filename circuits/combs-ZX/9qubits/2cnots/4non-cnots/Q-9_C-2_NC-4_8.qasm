OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[4];
z q[6];
x q[0];
cx q[5], q[4];
z q[4];
cx q[4], q[6];
