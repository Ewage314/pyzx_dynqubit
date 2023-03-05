OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[15];
cx q[13], q[3];
cx q[13], q[9];
cx q[9], q[2];
cx q[3], q[9];
