OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[6];
cx q[10], q[9];
cx q[6], q[5];
cx q[3], q[9];
