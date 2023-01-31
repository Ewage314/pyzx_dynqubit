OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[6];
x q[6];
cx q[0], q[6];
cx q[6], q[1];
