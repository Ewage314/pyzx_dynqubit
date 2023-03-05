OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[7];
x q[4];
cx q[6], q[13];
cx q[6], q[12];
x q[10];
cx q[0], q[4];
