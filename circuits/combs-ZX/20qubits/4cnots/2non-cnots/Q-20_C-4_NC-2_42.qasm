OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[13];
cx q[16], q[19];
cx q[10], q[11];
cx q[17], q[14];
z q[11];
cx q[18], q[0];
