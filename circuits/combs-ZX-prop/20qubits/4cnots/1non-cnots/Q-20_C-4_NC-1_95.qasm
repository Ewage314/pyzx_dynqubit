OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[16];
cx q[2], q[17];
cx q[10], q[7];
z q[5];
cx q[2], q[1];
