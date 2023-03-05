OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[0], q[1];
cx q[5], q[0];
x q[3];
cx q[2], q[10];
cx q[13], q[15];
