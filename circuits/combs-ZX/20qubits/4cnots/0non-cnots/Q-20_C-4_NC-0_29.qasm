OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[16];
cx q[5], q[17];
cx q[12], q[7];
cx q[7], q[0];
