OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[0], q[9];
x q[6];
x q[0];
z q[9];
z q[1];
cx q[3], q[4];
