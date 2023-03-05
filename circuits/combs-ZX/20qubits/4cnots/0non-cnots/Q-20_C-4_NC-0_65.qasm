OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[7];
cx q[17], q[4];
cx q[3], q[4];
cx q[2], q[11];
