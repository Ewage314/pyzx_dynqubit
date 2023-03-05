OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[1];
cx q[11], q[5];
cx q[13], q[1];
z q[8];
x q[4];
cx q[0], q[8];
