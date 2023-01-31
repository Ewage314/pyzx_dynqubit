OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
z q[1];
x q[5];
x q[4];
cx q[0], q[1];
z q[4];
cx q[0], q[5];
