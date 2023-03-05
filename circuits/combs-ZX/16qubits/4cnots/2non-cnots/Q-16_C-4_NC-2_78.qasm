OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[11], q[15];
x q[3];
x q[4];
cx q[12], q[4];
cx q[4], q[5];
