OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[2];
x q[2];
cx q[8], q[12];
cx q[13], q[14];
z q[8];
cx q[15], q[9];
