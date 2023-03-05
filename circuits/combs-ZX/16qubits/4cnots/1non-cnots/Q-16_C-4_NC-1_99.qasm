OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[2];
x q[11];
cx q[10], q[12];
cx q[7], q[5];
cx q[7], q[8];
