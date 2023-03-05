OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[9];
cx q[12], q[2];
cx q[16], q[3];
cx q[9], q[18];
cx q[2], q[15];
