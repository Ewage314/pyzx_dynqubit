OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[8];
z q[11];
cx q[17], q[3];
cx q[14], q[16];
cx q[5], q[6];
cx q[11], q[8];
