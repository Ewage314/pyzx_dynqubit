OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[16];
cx q[6], q[8];
z q[1];
cx q[19], q[4];
cx q[2], q[13];
