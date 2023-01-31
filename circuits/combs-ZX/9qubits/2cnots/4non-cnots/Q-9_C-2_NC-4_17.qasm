OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[4];
x q[7];
z q[1];
x q[2];
cx q[8], q[7];
cx q[7], q[4];
