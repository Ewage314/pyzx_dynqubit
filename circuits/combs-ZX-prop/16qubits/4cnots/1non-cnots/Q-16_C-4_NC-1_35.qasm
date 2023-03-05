OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[2], q[4];
cx q[15], q[14];
x q[4];
cx q[7], q[4];
