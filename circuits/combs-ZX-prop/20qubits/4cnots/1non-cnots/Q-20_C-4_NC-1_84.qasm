OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[12];
cx q[17], q[10];
cx q[9], q[12];
cx q[12], q[18];
cx q[7], q[17];
