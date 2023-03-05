OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[18], q[10];
cx q[12], q[16];
cx q[2], q[3];
cx q[12], q[13];
