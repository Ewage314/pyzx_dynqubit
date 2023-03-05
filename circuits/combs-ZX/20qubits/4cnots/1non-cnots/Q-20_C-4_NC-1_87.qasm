OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[1];
cx q[0], q[18];
cx q[4], q[18];
cx q[2], q[10];
cx q[14], q[2];
