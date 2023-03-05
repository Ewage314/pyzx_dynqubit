OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[12];
z q[4];
cx q[8], q[11];
cx q[10], q[12];
x q[0];
cx q[4], q[6];
