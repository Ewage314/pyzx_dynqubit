OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[3];
cx q[14], q[3];
cx q[6], q[3];
cx q[5], q[16];
