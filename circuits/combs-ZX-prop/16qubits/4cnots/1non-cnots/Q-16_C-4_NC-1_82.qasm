OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[8];
cx q[12], q[14];
cx q[0], q[3];
cx q[0], q[5];
cx q[4], q[9];
