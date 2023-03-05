OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[16];
cx q[3], q[13];
cx q[8], q[12];
cx q[8], q[17];
