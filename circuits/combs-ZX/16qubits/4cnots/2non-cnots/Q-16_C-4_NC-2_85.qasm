OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[11];
z q[13];
z q[11];
cx q[3], q[11];
cx q[12], q[6];
cx q[11], q[10];
