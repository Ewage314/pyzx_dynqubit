OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[12];
x q[4];
cx q[4], q[12];
cx q[3], q[12];
z q[15];
cx q[10], q[2];
