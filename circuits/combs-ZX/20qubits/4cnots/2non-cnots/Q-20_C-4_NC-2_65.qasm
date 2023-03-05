OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[2];
x q[6];
cx q[6], q[3];
cx q[1], q[15];
cx q[16], q[13];
cx q[16], q[12];
