OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[1];
cx q[7], q[8];
x q[8];
cx q[0], q[9];
cx q[4], q[11];
cx q[15], q[6];
