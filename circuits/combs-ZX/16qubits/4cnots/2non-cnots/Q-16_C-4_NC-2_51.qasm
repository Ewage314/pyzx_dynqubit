OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[9];
cx q[5], q[8];
cx q[13], q[12];
cx q[5], q[15];
z q[6];
cx q[5], q[9];
