OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[11];
cx q[19], q[17];
cx q[16], q[17];
cx q[8], q[15];
cx q[17], q[19];
