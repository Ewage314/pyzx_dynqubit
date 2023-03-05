OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[0];
cx q[16], q[8];
x q[0];
cx q[8], q[9];
cx q[17], q[2];
