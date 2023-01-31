OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[1], q[2];
x q[0];
z q[5];
cx q[5], q[2];
