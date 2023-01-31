OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
x q[2];
x q[1];
cx q[5], q[0];
z q[2];
x q[0];
cx q[5], q[0];
