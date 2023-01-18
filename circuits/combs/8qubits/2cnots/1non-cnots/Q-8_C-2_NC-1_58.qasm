OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[4];
cx q[2], q[3];
cx q[4], q[1];
