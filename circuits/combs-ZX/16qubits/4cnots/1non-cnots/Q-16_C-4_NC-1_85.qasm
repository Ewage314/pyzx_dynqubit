OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[8];
cx q[12], q[13];
cx q[11], q[9];
z q[13];
cx q[3], q[10];
