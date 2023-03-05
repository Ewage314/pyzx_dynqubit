OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[5];
cx q[3], q[13];
cx q[0], q[8];
z q[1];
cx q[4], q[12];
