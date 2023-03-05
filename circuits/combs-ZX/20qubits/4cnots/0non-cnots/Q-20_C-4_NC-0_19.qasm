OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[17];
cx q[8], q[10];
cx q[17], q[12];
cx q[10], q[6];
