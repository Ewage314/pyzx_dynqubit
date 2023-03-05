OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[15];
cx q[4], q[6];
z q[8];
cx q[0], q[11];
cx q[3], q[5];
