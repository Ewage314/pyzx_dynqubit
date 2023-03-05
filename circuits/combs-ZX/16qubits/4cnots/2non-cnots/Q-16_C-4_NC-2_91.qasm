OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[8];
cx q[13], q[12];
cx q[6], q[0];
z q[5];
x q[0];
cx q[14], q[4];
