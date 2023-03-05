OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[0], q[7];
z q[14];
cx q[16], q[12];
cx q[0], q[10];
cx q[8], q[10];
