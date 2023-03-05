OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[16];
cx q[3], q[4];
cx q[0], q[1];
cx q[13], q[6];
