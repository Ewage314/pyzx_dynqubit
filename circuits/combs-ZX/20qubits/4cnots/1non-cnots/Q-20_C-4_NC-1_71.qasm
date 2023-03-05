OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[12];
cx q[4], q[5];
z q[4];
cx q[15], q[11];
cx q[2], q[13];
