OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[7];
cx q[7], q[9];
cx q[0], q[9];
cx q[5], q[11];
