OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[8];
cx q[3], q[2];
cx q[4], q[8];
cx q[7], q[8];
z q[8];
cx q[15], q[7];
