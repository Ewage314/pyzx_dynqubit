OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[15];
cx q[19], q[9];
cx q[0], q[15];
cx q[0], q[16];
