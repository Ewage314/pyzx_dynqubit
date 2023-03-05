OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[10];
cx q[0], q[16];
cx q[2], q[13];
cx q[4], q[16];
cx q[11], q[6];
