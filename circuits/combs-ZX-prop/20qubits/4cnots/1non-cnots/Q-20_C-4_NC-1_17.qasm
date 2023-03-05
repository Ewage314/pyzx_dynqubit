OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[7];
cx q[18], q[13];
z q[10];
cx q[10], q[12];
cx q[8], q[10];
