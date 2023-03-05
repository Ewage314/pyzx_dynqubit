OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[0], q[13];
cx q[18], q[11];
z q[8];
cx q[9], q[0];
cx q[17], q[5];
