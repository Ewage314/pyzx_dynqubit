OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[8];
x q[1];
z q[8];
cx q[2], q[14];
cx q[13], q[2];
cx q[3], q[4];
