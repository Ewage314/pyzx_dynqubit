OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[7];
z q[8];
cx q[5], q[4];
cx q[5], q[2];
