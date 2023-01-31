OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
z q[4];
x q[1];
x q[0];
z q[4];
cx q[6], q[0];
cx q[1], q[6];
