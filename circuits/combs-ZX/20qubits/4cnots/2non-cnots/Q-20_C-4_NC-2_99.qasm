OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[1];
cx q[13], q[6];
cx q[10], q[11];
cx q[4], q[11];
z q[11];
cx q[8], q[4];
