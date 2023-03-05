OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[10];
z q[10];
cx q[0], q[7];
cx q[8], q[3];
cx q[15], q[5];
cx q[1], q[4];
