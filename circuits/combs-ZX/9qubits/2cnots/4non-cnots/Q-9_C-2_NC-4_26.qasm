OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[7];
x q[2];
x q[6];
cx q[4], q[7];
z q[7];
cx q[8], q[2];
