OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[14];
cx q[5], q[6];
cx q[4], q[9];
x q[14];
cx q[2], q[0];
