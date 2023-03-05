OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[0], q[7];
x q[11];
cx q[6], q[9];
cx q[9], q[3];
cx q[1], q[5];
