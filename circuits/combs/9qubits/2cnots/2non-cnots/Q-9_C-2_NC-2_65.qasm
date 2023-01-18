OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[3];
x q[2];
x q[4];
cx q[4], q[2];
