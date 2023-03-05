OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[17];
cx q[2], q[11];
cx q[7], q[2];
cx q[8], q[14];
