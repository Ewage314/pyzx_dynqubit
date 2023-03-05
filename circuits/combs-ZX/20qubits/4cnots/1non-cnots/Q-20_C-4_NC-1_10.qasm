OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[4];
x q[6];
cx q[2], q[5];
cx q[7], q[8];
cx q[7], q[1];
