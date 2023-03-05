OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[2];
x q[8];
cx q[1], q[12];
cx q[0], q[3];
cx q[7], q[5];
