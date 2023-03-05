OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[19], q[8];
cx q[19], q[16];
cx q[12], q[17];
z q[5];
cx q[8], q[4];
