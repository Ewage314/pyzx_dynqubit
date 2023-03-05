OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[12];
x q[3];
cx q[2], q[12];
cx q[6], q[1];
cx q[7], q[11];
