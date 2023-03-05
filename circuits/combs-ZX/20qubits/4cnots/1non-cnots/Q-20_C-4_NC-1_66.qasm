OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[18], q[9];
cx q[12], q[9];
z q[12];
cx q[2], q[19];
cx q[5], q[1];
