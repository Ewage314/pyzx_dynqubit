OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[6], q[2];
z q[2];
x q[0];
x q[4];
x q[0];
cx q[1], q[4];
