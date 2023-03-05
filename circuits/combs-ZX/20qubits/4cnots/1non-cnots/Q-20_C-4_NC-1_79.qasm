OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[16];
z q[12];
cx q[9], q[3];
cx q[17], q[19];
cx q[18], q[13];
