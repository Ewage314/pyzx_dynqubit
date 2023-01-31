OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[7], q[6];
z q[6];
x q[6];
z q[1];
z q[5];
cx q[7], q[1];
