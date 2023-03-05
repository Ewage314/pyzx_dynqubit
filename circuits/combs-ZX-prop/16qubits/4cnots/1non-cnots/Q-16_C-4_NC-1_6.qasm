OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[1];
cx q[2], q[14];
x q[1];
cx q[3], q[12];
cx q[6], q[11];
