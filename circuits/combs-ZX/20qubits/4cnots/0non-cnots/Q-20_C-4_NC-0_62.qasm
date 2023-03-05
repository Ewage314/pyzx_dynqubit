OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[7];
cx q[12], q[8];
cx q[5], q[11];
cx q[1], q[16];
