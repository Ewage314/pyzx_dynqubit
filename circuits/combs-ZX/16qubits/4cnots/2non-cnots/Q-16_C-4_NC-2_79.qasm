OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[3];
z q[11];
cx q[10], q[3];
x q[12];
cx q[2], q[5];
cx q[13], q[6];
