OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[18];
x q[1];
cx q[8], q[19];
cx q[12], q[16];
cx q[6], q[11];
cx q[16], q[3];
