OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[11];
z q[2];
cx q[5], q[8];
cx q[12], q[15];
cx q[16], q[2];
cx q[12], q[1];
