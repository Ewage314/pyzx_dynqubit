OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[10];
z q[1];
cx q[11], q[16];
cx q[15], q[17];
cx q[18], q[16];
