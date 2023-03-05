OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[8];
cx q[15], q[14];
cx q[8], q[5];
z q[0];
cx q[5], q[1];
cx q[1], q[8];
