OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[5], q[13];
cx q[0], q[10];
x q[15];
cx q[3], q[7];
