OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[13];
x q[15];
cx q[0], q[4];
cx q[10], q[5];
cx q[12], q[6];
