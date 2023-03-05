OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[13];
z q[7];
cx q[8], q[10];
z q[17];
cx q[3], q[4];
cx q[12], q[10];
