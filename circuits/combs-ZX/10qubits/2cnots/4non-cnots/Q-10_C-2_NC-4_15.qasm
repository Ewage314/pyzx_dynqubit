OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[1];
z q[9];
cx q[8], q[4];
z q[2];
z q[7];
cx q[9], q[8];
