OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[6], q[8];
z q[8];
cx q[7], q[8];
x q[6];
cx q[1], q[9];
cx q[7], q[9];
