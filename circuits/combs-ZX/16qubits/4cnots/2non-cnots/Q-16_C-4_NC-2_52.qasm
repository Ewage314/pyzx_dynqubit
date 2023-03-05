OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[10];
x q[1];
cx q[0], q[5];
cx q[13], q[9];
cx q[10], q[15];
cx q[11], q[8];
