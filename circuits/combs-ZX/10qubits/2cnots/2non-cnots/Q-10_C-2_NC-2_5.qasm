OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[4];
cx q[4], q[5];
z q[1];
cx q[7], q[8];
