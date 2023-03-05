OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[12];
cx q[3], q[2];
z q[9];
cx q[2], q[10];
cx q[5], q[18];
cx q[17], q[11];
