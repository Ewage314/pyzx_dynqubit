OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[10], q[0];
z q[5];
cx q[4], q[1];
cx q[14], q[15];
