OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[9];
cx q[14], q[19];
cx q[10], q[11];
cx q[3], q[5];
