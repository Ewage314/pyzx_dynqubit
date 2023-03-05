OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[0], q[10];
cx q[3], q[11];
x q[3];
cx q[15], q[9];
cx q[3], q[10];
