OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
x q[3];
cx q[12], q[13];
cx q[10], q[7];
cx q[2], q[7];
