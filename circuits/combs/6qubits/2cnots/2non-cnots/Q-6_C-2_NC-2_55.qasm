OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
cx q[1], q[5];
x q[5];
x q[1];
cx q[0], q[1];
