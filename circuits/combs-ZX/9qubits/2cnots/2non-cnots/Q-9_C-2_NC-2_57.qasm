OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[2];
z q[1];
x q[5];
cx q[2], q[7];
