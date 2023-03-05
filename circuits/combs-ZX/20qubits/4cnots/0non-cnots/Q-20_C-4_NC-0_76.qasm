OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[1];
cx q[7], q[1];
cx q[16], q[11];
cx q[17], q[8];
