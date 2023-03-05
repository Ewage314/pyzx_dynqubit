OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[14];
x q[11];
cx q[2], q[17];
z q[17];
cx q[9], q[17];
cx q[5], q[15];
