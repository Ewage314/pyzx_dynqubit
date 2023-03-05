OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[14];
cx q[2], q[15];
z q[2];
cx q[11], q[4];
cx q[0], q[14];
cx q[6], q[9];
