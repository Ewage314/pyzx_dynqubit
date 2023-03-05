OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[13];
cx q[2], q[14];
x q[12];
cx q[5], q[6];
cx q[8], q[11];
cx q[5], q[12];
