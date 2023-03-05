OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[8];
cx q[4], q[15];
cx q[9], q[8];
cx q[0], q[2];
cx q[3], q[8];
