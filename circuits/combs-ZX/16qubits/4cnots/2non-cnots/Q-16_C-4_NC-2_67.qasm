OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[6];
cx q[6], q[15];
cx q[13], q[5];
z q[2];
cx q[5], q[1];
cx q[3], q[1];
