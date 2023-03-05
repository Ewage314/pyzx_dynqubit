OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[0], q[10];
cx q[10], q[13];
cx q[0], q[11];
cx q[2], q[15];
