OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[3];
cx q[0], q[12];
cx q[6], q[14];
cx q[9], q[0];
cx q[1], q[11];
