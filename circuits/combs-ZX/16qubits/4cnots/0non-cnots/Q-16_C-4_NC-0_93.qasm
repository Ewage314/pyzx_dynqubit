OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[12];
cx q[4], q[6];
cx q[6], q[10];
cx q[6], q[11];
