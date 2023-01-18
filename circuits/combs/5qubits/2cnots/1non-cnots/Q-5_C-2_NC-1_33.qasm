OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
x q[4];
cx q[3], q[4];
cx q[2], q[0];
