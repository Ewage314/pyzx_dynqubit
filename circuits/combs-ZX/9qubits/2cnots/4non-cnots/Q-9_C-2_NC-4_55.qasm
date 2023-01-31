OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[7];
z q[0];
cx q[4], q[7];
z q[8];
x q[0];
cx q[3], q[2];
