OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[5];
cx q[4], q[1];
cx q[3], q[1];
x q[5];
cx q[6], q[2];
