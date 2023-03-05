OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[4];
cx q[13], q[0];
cx q[9], q[10];
z q[4];
cx q[3], q[10];
