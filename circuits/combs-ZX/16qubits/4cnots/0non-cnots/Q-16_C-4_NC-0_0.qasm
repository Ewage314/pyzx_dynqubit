OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[1];
cx q[12], q[14];
cx q[10], q[6];
cx q[1], q[11];
