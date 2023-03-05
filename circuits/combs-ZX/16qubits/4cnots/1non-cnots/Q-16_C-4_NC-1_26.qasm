OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[4];
cx q[5], q[9];
z q[10];
cx q[8], q[13];
cx q[1], q[6];
