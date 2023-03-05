OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[8];
cx q[9], q[12];
cx q[9], q[4];
cx q[2], q[12];
cx q[16], q[10];
