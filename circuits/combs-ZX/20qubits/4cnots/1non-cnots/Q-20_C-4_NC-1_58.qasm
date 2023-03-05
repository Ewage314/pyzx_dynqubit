OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[8];
cx q[1], q[16];
cx q[8], q[7];
cx q[19], q[4];
cx q[19], q[15];
