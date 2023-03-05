OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[18], q[2];
cx q[17], q[12];
cx q[5], q[12];
z q[4];
cx q[3], q[6];
