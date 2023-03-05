OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[4];
cx q[3], q[12];
cx q[0], q[11];
cx q[4], q[1];
cx q[4], q[3];
