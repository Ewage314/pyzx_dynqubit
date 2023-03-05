OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[16];
cx q[19], q[9];
cx q[18], q[16];
cx q[4], q[0];
