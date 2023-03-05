OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[18], q[16];
cx q[3], q[4];
z q[7];
cx q[5], q[4];
z q[16];
cx q[1], q[19];
