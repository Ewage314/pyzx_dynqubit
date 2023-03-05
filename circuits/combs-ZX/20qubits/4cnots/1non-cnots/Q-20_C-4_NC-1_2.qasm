OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[15], q[11];
cx q[11], q[16];
z q[2];
cx q[10], q[16];
cx q[13], q[9];
