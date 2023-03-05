OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[0];
cx q[0], q[6];
z q[1];
cx q[11], q[9];
cx q[10], q[11];
cx q[3], q[8];
