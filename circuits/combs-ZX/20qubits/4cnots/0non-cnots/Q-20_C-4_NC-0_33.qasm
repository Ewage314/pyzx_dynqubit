OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[5];
cx q[15], q[10];
cx q[3], q[6];
cx q[2], q[16];
