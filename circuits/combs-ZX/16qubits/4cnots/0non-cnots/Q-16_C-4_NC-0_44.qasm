OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[15];
cx q[8], q[2];
cx q[5], q[14];
cx q[12], q[2];
