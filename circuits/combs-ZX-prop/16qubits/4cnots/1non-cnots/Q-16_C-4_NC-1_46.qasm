OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[8];
x q[0];
cx q[12], q[6];
cx q[2], q[6];
cx q[7], q[0];
