OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[8];
cx q[15], q[10];
cx q[13], q[11];
x q[8];
cx q[4], q[2];
