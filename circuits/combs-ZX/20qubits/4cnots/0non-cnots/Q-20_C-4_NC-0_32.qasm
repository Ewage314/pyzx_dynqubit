OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[11];
cx q[17], q[2];
cx q[4], q[16];
cx q[18], q[7];
