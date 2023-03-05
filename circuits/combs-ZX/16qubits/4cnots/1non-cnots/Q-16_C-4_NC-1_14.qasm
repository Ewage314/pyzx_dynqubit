OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[8];
cx q[6], q[11];
cx q[14], q[2];
x q[1];
cx q[11], q[2];
