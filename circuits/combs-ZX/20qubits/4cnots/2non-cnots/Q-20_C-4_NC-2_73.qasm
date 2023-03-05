OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[19];
z q[4];
cx q[11], q[6];
z q[12];
cx q[4], q[7];
cx q[12], q[10];
