OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[8];
cx q[5], q[13];
z q[5];
cx q[4], q[10];
cx q[0], q[4];
