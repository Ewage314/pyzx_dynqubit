OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[0];
x q[11];
cx q[0], q[4];
cx q[13], q[11];
cx q[5], q[8];
