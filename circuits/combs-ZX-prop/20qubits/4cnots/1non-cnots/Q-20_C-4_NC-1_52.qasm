OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[13];
cx q[1], q[16];
cx q[1], q[13];
x q[9];
cx q[11], q[8];
