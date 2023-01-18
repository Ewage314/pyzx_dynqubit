OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[7], q[9];
x q[3];
cx q[2], q[6];
cx q[4], q[6];
cx q[6], q[9];
