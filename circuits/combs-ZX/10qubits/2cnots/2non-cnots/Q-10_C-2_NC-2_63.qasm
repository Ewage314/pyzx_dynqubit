OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[1];
z q[6];
cx q[5], q[2];
cx q[6], q[4];
