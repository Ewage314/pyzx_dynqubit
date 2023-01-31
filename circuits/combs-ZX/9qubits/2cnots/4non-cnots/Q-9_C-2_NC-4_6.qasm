OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[7];
z q[4];
z q[7];
x q[0];
cx q[8], q[5];
cx q[0], q[2];
