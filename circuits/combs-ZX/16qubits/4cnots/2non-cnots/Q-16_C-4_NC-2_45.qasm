OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[6];
z q[10];
cx q[14], q[3];
x q[14];
cx q[6], q[3];
cx q[11], q[2];
