OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[12];
cx q[17], q[1];
x q[5];
cx q[17], q[11];
cx q[14], q[3];
