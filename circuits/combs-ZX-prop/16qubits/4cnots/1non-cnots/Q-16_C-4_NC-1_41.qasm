OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[5];
cx q[13], q[14];
cx q[7], q[9];
cx q[7], q[0];
cx q[3], q[14];
