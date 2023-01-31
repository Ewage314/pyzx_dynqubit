OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[2];
x q[0];
cx q[3], q[2];
cx q[4], q[1];
