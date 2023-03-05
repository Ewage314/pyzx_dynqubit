OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[0], q[17];
cx q[19], q[16];
cx q[18], q[19];
z q[10];
cx q[9], q[6];
