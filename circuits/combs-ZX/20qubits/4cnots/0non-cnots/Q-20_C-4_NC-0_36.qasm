OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[10];
cx q[18], q[8];
cx q[2], q[9];
cx q[8], q[10];
