OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[6];
cx q[8], q[13];
cx q[10], q[11];
z q[4];
cx q[12], q[10];
