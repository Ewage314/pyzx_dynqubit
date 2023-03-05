OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[15];
cx q[6], q[0];
cx q[4], q[5];
x q[2];
z q[3];
cx q[9], q[2];
