OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[19];
cx q[6], q[9];
cx q[5], q[11];
cx q[13], q[3];
