OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[5];
cx q[5], q[18];
cx q[18], q[6];
cx q[2], q[16];
