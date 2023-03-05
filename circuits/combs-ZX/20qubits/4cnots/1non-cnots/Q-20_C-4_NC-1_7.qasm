OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[11];
z q[9];
cx q[1], q[10];
cx q[12], q[6];
cx q[18], q[15];
