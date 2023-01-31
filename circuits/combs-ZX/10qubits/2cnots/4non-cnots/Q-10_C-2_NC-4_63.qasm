OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[4];
cx q[7], q[4];
z q[3];
x q[4];
z q[6];
cx q[9], q[4];
