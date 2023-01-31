OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[0];
cx q[3], q[6];
cx q[1], q[6];
cx q[4], q[6];
x q[8];
cx q[5], q[4];
