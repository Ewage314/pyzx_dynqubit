OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[12];
x q[1];
cx q[14], q[1];
cx q[4], q[11];
cx q[1], q[14];
cx q[0], q[9];
