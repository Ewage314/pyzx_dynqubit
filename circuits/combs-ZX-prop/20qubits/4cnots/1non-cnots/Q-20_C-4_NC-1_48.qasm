OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[16];
cx q[7], q[5];
cx q[17], q[0];
z q[2];
cx q[8], q[12];
