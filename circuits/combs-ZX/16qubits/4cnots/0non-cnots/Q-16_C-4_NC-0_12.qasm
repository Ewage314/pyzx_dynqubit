OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[4];
cx q[8], q[11];
cx q[1], q[14];
cx q[2], q[4];
