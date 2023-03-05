OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[12];
cx q[10], q[14];
cx q[13], q[2];
x q[2];
z q[12];
cx q[15], q[6];
