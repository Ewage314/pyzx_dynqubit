OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[5];
cx q[6], q[12];
x q[0];
cx q[3], q[0];
x q[1];
cx q[1], q[5];
