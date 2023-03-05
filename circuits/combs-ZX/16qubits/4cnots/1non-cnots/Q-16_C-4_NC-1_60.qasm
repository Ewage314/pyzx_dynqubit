OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[15];
cx q[2], q[9];
cx q[1], q[6];
z q[8];
cx q[12], q[11];
