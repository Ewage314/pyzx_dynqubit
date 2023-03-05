OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[2];
cx q[15], q[5];
cx q[4], q[8];
cx q[5], q[2];
cx q[4], q[13];
