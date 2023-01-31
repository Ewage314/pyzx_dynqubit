OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[6];
cx q[8], q[6];
z q[5];
cx q[7], q[8];
