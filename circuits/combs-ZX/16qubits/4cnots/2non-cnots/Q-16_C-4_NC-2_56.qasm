OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[15];
cx q[0], q[6];
cx q[15], q[5];
cx q[11], q[2];
x q[4];
cx q[5], q[10];
