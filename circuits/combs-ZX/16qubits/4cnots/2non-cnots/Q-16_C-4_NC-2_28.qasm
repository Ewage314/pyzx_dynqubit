OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[15];
z q[3];
cx q[4], q[9];
cx q[2], q[13];
x q[1];
cx q[13], q[3];
