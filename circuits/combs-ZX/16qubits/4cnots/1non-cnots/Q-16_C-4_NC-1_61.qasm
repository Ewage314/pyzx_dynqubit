OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[3];
cx q[11], q[5];
cx q[13], q[5];
cx q[7], q[2];
cx q[12], q[10];
