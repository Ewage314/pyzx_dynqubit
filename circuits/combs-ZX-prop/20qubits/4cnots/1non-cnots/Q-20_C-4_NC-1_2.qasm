OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[4];
cx q[13], q[7];
cx q[1], q[7];
z q[1];
cx q[2], q[10];
