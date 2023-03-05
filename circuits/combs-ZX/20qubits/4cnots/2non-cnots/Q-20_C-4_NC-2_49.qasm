OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[2];
z q[4];
x q[3];
cx q[16], q[13];
cx q[6], q[17];
cx q[13], q[14];
