OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[9];
cx q[2], q[3];
cx q[4], q[10];
cx q[8], q[3];
cx q[15], q[3];
