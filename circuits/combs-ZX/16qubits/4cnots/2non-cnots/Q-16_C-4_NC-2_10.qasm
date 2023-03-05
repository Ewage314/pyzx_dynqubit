OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[0];
cx q[12], q[11];
cx q[3], q[4];
z q[12];
x q[9];
cx q[5], q[7];
