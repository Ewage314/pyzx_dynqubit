OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[6];
cx q[11], q[10];
cx q[9], q[2];
cx q[12], q[8];
cx q[10], q[16];
