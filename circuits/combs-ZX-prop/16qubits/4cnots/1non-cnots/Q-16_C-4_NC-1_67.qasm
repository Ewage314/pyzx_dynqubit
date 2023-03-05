OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[0], q[11];
cx q[4], q[15];
x q[3];
cx q[10], q[6];
cx q[8], q[10];
