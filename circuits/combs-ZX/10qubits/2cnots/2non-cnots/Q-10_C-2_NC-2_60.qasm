OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[2];
x q[8];
cx q[7], q[6];
cx q[0], q[4];
