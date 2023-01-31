OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[6];
x q[4];
cx q[2], q[0];
cx q[2], q[0];
