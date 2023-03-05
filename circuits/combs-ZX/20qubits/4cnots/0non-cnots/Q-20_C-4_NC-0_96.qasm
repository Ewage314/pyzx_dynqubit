OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[17];
cx q[6], q[4];
cx q[16], q[9];
cx q[0], q[16];
