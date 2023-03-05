OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[19];
cx q[6], q[10];
cx q[10], q[13];
cx q[16], q[12];
