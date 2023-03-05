OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[14];
x q[8];
cx q[11], q[0];
cx q[2], q[8];
cx q[12], q[8];
