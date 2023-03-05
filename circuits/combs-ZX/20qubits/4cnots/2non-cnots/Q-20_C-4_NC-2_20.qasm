OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[18], q[5];
z q[11];
cx q[19], q[1];
x q[17];
cx q[5], q[0];
cx q[5], q[8];
