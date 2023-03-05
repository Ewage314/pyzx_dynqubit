OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[15];
cx q[0], q[4];
z q[2];
cx q[8], q[1];
cx q[5], q[2];
