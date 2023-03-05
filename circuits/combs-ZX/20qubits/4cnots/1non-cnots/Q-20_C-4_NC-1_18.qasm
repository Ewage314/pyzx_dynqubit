OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[13];
cx q[12], q[11];
cx q[19], q[16];
cx q[19], q[2];
cx q[17], q[5];
