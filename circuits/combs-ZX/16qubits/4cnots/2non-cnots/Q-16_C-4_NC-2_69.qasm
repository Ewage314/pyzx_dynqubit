OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[2];
z q[14];
x q[11];
cx q[8], q[14];
cx q[8], q[15];
cx q[2], q[1];
