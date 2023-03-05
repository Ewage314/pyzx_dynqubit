OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[5];
cx q[2], q[0];
cx q[13], q[3];
cx q[10], q[7];
