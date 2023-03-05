OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[11];
x q[9];
cx q[15], q[7];
z q[1];
cx q[0], q[8];
cx q[9], q[10];
