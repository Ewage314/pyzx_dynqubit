OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[4];
x q[7];
x q[1];
z q[1];
x q[0];
cx q[1], q[0];
