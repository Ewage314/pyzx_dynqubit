OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[2];
x q[5];
cx q[5], q[14];
cx q[3], q[9];
cx q[13], q[5];
