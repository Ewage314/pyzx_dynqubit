OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[6];
cx q[6], q[12];
cx q[17], q[15];
x q[13];
x q[12];
cx q[16], q[6];
