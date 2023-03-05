OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[2];
cx q[6], q[10];
z q[9];
cx q[8], q[15];
z q[10];
cx q[5], q[12];
