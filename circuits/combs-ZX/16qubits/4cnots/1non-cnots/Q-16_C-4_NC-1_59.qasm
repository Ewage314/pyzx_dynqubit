OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[0], q[3];
cx q[11], q[8];
x q[10];
cx q[12], q[14];
cx q[4], q[12];
