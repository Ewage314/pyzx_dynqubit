OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[1];
z q[4];
z q[5];
cx q[7], q[4];
z q[6];
cx q[4], q[6];
