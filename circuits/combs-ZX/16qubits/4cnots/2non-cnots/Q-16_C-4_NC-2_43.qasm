OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[5];
cx q[0], q[10];
z q[14];
cx q[4], q[1];
cx q[7], q[2];
cx q[9], q[0];
