OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[9];
x q[8];
cx q[12], q[9];
cx q[4], q[12];
cx q[3], q[11];
