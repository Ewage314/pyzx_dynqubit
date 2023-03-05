OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[3];
cx q[3], q[4];
cx q[8], q[2];
x q[12];
cx q[0], q[10];
