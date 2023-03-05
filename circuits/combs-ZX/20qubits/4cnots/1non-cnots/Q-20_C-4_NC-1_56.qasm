OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[14];
cx q[1], q[4];
x q[0];
cx q[19], q[10];
cx q[11], q[16];
