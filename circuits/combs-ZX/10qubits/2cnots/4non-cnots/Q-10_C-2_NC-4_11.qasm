OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[2];
x q[0];
z q[7];
z q[9];
z q[3];
cx q[3], q[4];
