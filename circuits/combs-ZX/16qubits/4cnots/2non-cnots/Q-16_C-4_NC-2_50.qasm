OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[7];
cx q[6], q[9];
cx q[13], q[4];
x q[4];
cx q[12], q[4];
cx q[13], q[15];
