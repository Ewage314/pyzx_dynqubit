OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[5];
cx q[18], q[2];
z q[18];
cx q[2], q[5];
cx q[7], q[6];
