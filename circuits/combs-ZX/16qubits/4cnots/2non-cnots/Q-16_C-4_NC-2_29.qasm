OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[13];
cx q[13], q[11];
z q[14];
x q[5];
cx q[0], q[11];
cx q[6], q[0];
