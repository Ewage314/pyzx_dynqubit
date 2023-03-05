OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[4];
cx q[11], q[4];
cx q[5], q[10];
x q[17];
cx q[0], q[3];
