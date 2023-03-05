OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[3];
cx q[2], q[5];
cx q[7], q[2];
x q[4];
z q[2];
cx q[5], q[10];
