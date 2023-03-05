OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[3];
cx q[0], q[10];
cx q[0], q[4];
cx q[16], q[17];
