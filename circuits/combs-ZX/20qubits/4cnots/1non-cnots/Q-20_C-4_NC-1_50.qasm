OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[11];
cx q[0], q[1];
z q[17];
cx q[4], q[9];
cx q[10], q[4];
