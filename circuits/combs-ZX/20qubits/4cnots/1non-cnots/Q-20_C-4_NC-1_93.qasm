OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[16];
z q[6];
cx q[8], q[10];
cx q[7], q[12];
cx q[11], q[10];
