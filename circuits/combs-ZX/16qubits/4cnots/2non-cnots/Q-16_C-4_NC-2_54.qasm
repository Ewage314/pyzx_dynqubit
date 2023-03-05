OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[10];
cx q[5], q[11];
z q[13];
cx q[11], q[9];
x q[6];
cx q[5], q[2];
