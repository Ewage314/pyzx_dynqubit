OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[16];
cx q[13], q[16];
cx q[3], q[2];
cx q[14], q[18];
cx q[12], q[4];
