OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[18];
cx q[12], q[1];
cx q[8], q[16];
cx q[8], q[19];
