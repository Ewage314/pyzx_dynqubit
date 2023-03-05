OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[10];
cx q[8], q[2];
cx q[13], q[4];
cx q[11], q[5];
