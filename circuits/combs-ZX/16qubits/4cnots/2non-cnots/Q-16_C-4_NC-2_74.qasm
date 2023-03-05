OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[8];
cx q[10], q[6];
x q[3];
z q[0];
cx q[2], q[0];
cx q[15], q[5];
