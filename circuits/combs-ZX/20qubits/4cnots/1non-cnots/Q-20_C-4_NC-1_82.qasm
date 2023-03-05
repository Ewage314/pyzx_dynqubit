OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[5];
cx q[7], q[12];
cx q[2], q[16];
cx q[10], q[8];
cx q[15], q[1];
