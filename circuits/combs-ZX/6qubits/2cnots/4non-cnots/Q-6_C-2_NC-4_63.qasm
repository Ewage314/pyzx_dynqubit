OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
z q[4];
x q[4];
cx q[3], q[4];
x q[0];
z q[0];
cx q[5], q[1];
