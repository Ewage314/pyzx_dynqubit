OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[5];
cx q[10], q[2];
cx q[5], q[13];
cx q[2], q[19];
cx q[4], q[18];
