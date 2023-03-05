OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[11];
cx q[4], q[8];
cx q[2], q[10];
cx q[0], q[6];
