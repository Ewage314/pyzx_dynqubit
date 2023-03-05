OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[11];
cx q[15], q[3];
cx q[15], q[3];
cx q[2], q[12];
cx q[11], q[14];
