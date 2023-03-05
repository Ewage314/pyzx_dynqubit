OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[16];
cx q[12], q[4];
cx q[16], q[18];
cx q[1], q[10];
