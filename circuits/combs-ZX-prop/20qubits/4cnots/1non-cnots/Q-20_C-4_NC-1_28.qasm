OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[11];
cx q[4], q[12];
cx q[6], q[15];
cx q[4], q[5];
cx q[2], q[13];
