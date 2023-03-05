OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[2];
z q[4];
cx q[15], q[2];
cx q[0], q[8];
cx q[2], q[15];
cx q[5], q[13];
