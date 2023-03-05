OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[5];
z q[7];
cx q[10], q[12];
cx q[11], q[13];
z q[13];
cx q[0], q[9];
