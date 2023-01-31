OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[7];
cx q[3], q[4];
x q[5];
cx q[1], q[4];
