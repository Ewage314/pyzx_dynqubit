OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[2];
cx q[9], q[6];
cx q[16], q[17];
cx q[10], q[9];
cx q[12], q[15];
