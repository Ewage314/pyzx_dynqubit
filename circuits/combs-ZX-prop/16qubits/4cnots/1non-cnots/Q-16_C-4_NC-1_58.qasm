OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[1];
z q[10];
cx q[2], q[12];
cx q[11], q[1];
cx q[6], q[8];
