OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[14];
cx q[12], q[2];
cx q[7], q[15];
x q[15];
z q[11];
cx q[11], q[15];
