OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[11];
cx q[11], q[12];
x q[7];
x q[11];
cx q[0], q[13];
cx q[12], q[7];
