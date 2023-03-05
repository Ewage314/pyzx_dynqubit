OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[13];
x q[15];
cx q[17], q[12];
cx q[10], q[9];
cx q[18], q[8];
