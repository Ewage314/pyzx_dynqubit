OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[11];
cx q[18], q[5];
x q[5];
cx q[8], q[3];
cx q[0], q[3];
