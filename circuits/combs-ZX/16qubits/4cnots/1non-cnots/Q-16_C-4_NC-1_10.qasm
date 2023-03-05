OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[11];
cx q[1], q[13];
cx q[4], q[13];
z q[4];
cx q[0], q[4];
