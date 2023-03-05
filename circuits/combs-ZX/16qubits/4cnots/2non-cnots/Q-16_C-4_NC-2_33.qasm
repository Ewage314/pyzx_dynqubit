OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[9];
x q[9];
cx q[1], q[6];
cx q[9], q[14];
cx q[14], q[11];
cx q[6], q[9];
