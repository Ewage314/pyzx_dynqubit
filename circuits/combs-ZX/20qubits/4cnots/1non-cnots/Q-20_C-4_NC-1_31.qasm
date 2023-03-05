OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[10];
z q[6];
cx q[18], q[14];
cx q[6], q[15];
cx q[18], q[5];
