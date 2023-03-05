OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[0], q[11];
x q[8];
cx q[6], q[14];
cx q[8], q[4];
cx q[14], q[0];
