OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[12];
cx q[9], q[7];
z q[4];
cx q[8], q[9];
cx q[12], q[10];
cx q[6], q[8];
