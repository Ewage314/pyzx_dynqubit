OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[16];
cx q[11], q[10];
cx q[8], q[19];
cx q[13], q[8];
