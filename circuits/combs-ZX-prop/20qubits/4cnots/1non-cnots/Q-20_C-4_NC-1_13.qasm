OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[10];
z q[2];
cx q[4], q[19];
cx q[18], q[12];
cx q[7], q[11];
