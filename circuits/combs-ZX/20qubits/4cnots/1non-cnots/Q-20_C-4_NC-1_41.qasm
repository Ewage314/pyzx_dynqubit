OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[3];
z q[15];
cx q[1], q[18];
cx q[10], q[3];
cx q[4], q[10];
