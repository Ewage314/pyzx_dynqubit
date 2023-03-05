OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[18], q[16];
cx q[16], q[0];
x q[9];
cx q[1], q[19];
cx q[15], q[11];
