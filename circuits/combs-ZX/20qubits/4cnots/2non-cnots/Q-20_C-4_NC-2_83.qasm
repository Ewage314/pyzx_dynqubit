OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[10];
cx q[10], q[15];
z q[16];
cx q[10], q[4];
cx q[9], q[15];
cx q[9], q[1];
