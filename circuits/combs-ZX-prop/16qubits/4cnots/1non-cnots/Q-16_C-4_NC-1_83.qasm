OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[11];
cx q[13], q[0];
cx q[10], q[5];
x q[11];
cx q[7], q[12];
