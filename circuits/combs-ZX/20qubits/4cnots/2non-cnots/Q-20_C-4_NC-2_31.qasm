OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[11];
z q[19];
cx q[5], q[19];
cx q[18], q[1];
cx q[12], q[10];
cx q[6], q[9];
