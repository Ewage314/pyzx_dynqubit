OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[8];
cx q[10], q[5];
cx q[2], q[5];
cx q[14], q[3];
cx q[10], q[1];
