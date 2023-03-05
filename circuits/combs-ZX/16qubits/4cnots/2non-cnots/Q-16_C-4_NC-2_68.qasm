OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[8];
cx q[12], q[3];
cx q[7], q[14];
cx q[11], q[8];
z q[12];
cx q[0], q[7];
