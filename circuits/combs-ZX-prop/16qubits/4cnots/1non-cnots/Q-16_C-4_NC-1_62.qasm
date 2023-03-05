OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[6];
cx q[13], q[11];
cx q[2], q[13];
cx q[10], q[9];
cx q[3], q[13];
