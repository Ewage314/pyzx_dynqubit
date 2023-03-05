OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[9];
cx q[4], q[10];
cx q[4], q[11];
cx q[7], q[6];
