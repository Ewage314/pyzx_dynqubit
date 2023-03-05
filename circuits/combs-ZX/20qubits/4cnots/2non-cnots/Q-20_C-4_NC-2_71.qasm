OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[18], q[3];
z q[10];
z q[10];
cx q[18], q[6];
cx q[3], q[5];
cx q[13], q[17];
