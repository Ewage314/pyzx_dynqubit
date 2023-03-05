OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[14];
cx q[11], q[6];
cx q[13], q[1];
cx q[6], q[10];
