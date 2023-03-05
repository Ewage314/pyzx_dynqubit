OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[14];
cx q[5], q[10];
cx q[14], q[19];
cx q[10], q[17];
cx q[9], q[0];
