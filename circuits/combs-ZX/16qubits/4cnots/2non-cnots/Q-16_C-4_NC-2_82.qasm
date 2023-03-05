OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[3];
x q[0];
z q[13];
cx q[5], q[13];
cx q[8], q[14];
cx q[5], q[11];
