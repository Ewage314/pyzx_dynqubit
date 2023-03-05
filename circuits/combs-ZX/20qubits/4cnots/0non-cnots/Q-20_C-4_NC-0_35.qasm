OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[10];
cx q[17], q[9];
cx q[10], q[1];
cx q[8], q[4];
