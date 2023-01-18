OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[3], q[0];
x q[9];
cx q[6], q[0];
cx q[2], q[9];
cx q[4], q[0];
cx q[6], q[9];
