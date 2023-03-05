OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[10];
cx q[5], q[12];
cx q[11], q[10];
z q[0];
cx q[8], q[12];
