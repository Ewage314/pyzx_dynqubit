OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[2];
cx q[1], q[2];
cx q[4], q[2];
