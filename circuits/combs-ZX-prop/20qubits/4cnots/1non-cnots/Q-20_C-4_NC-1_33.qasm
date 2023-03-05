OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[19];
cx q[11], q[17];
x q[11];
cx q[8], q[3];
cx q[2], q[8];
