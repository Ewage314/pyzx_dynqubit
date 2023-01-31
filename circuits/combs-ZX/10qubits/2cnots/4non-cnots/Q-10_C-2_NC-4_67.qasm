OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[4];
x q[1];
cx q[3], q[0];
z q[9];
x q[8];
cx q[8], q[7];
