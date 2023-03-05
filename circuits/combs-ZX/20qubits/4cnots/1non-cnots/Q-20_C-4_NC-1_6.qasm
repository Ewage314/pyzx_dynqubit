OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[10];
cx q[8], q[11];
cx q[18], q[2];
x q[17];
cx q[6], q[10];
