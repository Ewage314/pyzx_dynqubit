OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
z q[10];
cx q[7], q[0];
cx q[0], q[8];
cx q[8], q[0];
