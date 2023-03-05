OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[0], q[15];
cx q[6], q[8];
cx q[0], q[6];
x q[4];
cx q[8], q[9];
