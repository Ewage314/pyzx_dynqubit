OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[9];
x q[1];
cx q[5], q[0];
cx q[0], q[9];
